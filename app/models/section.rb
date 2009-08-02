class Section < ActiveRecord::Base
  serialize :prepress_list, Hash
  serialize :bindery_list, Hash
  serialize :letterpress_list, Hash

  belongs_to :order
  belongs_to :paper_stock
  belongs_to :press
  belongs_to :bindery_machine, :class_name => "Bindery"
  belongs_to :letterpress_machine, :class_name => "Letterpress"
  
  has_many :notes, :as => :notable
  has_many :costs, :as => :costable
  has_one :press_schedule

  attr_accessible :unit_quantity, :debug

  # Validations
  validates_presence_of :order
  validates_format_of :finish_flat_size, :with => /\d+(\.\d+)?x\d+(\.\d+)?/, :message => "must be in the format ##.##x##.##"
  validates_format_of :finish_fold_size, :with => /\d+(\.\d+)?x\d+(\.\d+)?/, :message => "must be in the format ##.##x##.##"
  validates_inclusion_of :layout, :in => %w( one-sided perfect sheet-wise work-and-turn work-and-tumble), :message => "Sorry, I don't recognize '{{value}}' as a valid layout."

  # What to do about the quantities?

  def populate_page_sizes_by_order
    self.parent_size = self.order.parent_size
    self.press_size = self.order.press_size
  end

  # Used to suggest number of ups on a given page
  def calculate_ups
    # Define number of times we can print job on a given page size
    # Calculate: (press_sheet_size.horizontal / finish_flat_size.horizontal) *
    #            (press_sheet_size.vertical / finish_flat_size.vertical)
    # [23x17.5 -> 3x5]: [(23 / 3) * (17.5 * 5)].truncate
    # (7.666).truncate * (3.5).truncate

    x,  y  = self.paper_stock.parent_sheet.split("x")
    x2, y2 = x.to_f, y.to_f / self.out # Dividing along the y-axis
    x3, y3 = self.finish_flat_size.split("x")

    return (x2.to_f / x3.to_f).truncate * (y2.to_f / y3.to_f).truncate
  end

  def calculate_stock_price(markup = self.stock_sell_percent)
    markup = 1 + markup 
    return (self.paper_stock.company_cost * markup).round(2)
  end

  def cost_set
    order.cost_set
  end

  def cost(units, options={})
    @debug = true if options[:debug] == true

    unit_quantity = units
    ordered = calculate_quantity_ordered( unit_quantity )
    required = calculate_quantity_required( ordered )
    allowed = calculate_quantity_allowed( required )

    if @debug == true
      puts "Ordered/required/allowed: #{ordered}/#{required}/#{allowed}"
    end

    prices = {}
    prices["plates"] = plate_cost
    # prices["ink"] = calculate_color_count * 35 # <-- I think this is included in press cost
    prices["prepress"] = prepress_cost
    prices["paper"] = paper_cost(:quantity => allowed, :adjustment => 0.25)
    prices["press"] = press_cost(:quantity => allowed) # <--- required instead of allowed? Must be allowed, I think
    prices["bindery"] = bindery_cost(:quantity => ordered, :quantity_required => required, :quantity_allowed => allowed)
    prices["letterpress"] = letterpress_cost(:quantity => ordered, :quantity_required => required, :quantity_allowed => allowed)

    sum = 0

    prices.each do |index, cost|
      puts "#{index}: $#{cost}" if @debug
      sum += cost
    end

    return prices[:prepress] if unit_quantity <= 0

    puts "#{unit_quantity}:"
    puts " $#{sum}"
    puts "#{(sum / unit_quantity).round(2)}"
    return sum.round(2)
  end

  def prepress_cost(options={})
    prepress.cost(:cost_set => cost_set, :charges => prepress_list, :debug => @debug)
  end

  def paper_cost(options={})
    paper_stock.cost(:out => self.out, :quantity => options[:quantity], :adjustment => options[:adjustment], :debug => @debug)
  end

  def plate_cost(options={})
    calculate_color_count * 50 # This is a cheat. Choose a plate machine, then get this price later
  end

  def press_cost(options={})
    # press.cost(:cost_set => cost_set, quantity) # <-- is this qty allowed or qty ordered?
    press.cost(:cost_set => cost_set, :coverage => coverage, :paper_stock => paper_stock, :quantity_ordered => calculate_quantity_ordered(options[:quantity]), :color_count => calculate_color_count, :debug => @debug)
  end

  def letterpress_cost(options={})
    letterpress_machine.cost(:cost_set => cost_set, :ups => calculate_ups, :quantity => options[:quantity], :charges => letterpress_list)
  end

  def bindery_cost(options={})
    puts "About to calculate bindery costs...(#{bindery_list})" if @debug
    bindery_machine.cost(:cost_set => cost_set, :ups => calculate_ups, :quantity => options[:quantity], :quantity_required => options[:quantity_allowed], :charges => bindery_list, :debug => @debug)
  end

  def coverage
    self.ink_coverage
  end

  def calculate_color_count
    #ink_side_1 + ((ink_side_2.nil? or self.layout == "work-and-turn" or self.layout = "work-and-tumble")? 0 : ink_side_2)
    ink_count_side_1 + ink_count_side_2
  end

  def sides
    return 2 if ink_side_1 > 0 and ink_side_2 > 0
    return 1
  end

  def calculate_quantity_ordered(units_ordered)
    #puts "Quantity Ordered: #{quantity_ordered} #{self.quantity_per_order}"
    units_ordered.to_i * self.quantity_per_order.to_i
  end

  def calculate_quantity_required(section_quantity)
    section_quantity.to_f / calculate_ups
  end

  def calculate_quantity_allowed(quantity_required)
    puts "Calculating allowed for #{quantity_required} required" if @debug
    quantity_required + (calculate_mr_sheets( quantity_required ))
  end

  def calculate_mr_sheets(quantity)
    mr = 0
=begin
       Once costs and named scopes are setup
       self.costs.bindery.each do { |c| mr += 100 }
=end
    # 100 Per color Per Side
    puts "For #{quantity}, need #{calculate_color_count * 100} M/R + #{calculate_spoilage * quantity} Spoilage" if @debug
    mr += calculate_color_count * 100
    mr += calculate_spoilage * quantity
  end

  def calculate_spoilage
    return 0.050 if ink_coverage == "light"
    return 0.070 if ink_coverage == "medium"
    return 0.085 if ink_coverage == "medium_heavy"
    return 0.100 if ink_coverage == "heavy"
  end

  # Dummy method for now
  def prepress
    self.order.job.client.company.prepress
  end
end
