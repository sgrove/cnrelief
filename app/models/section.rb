class Section < ActiveRecord::Base
  belongs_to :order
  belongs_to :paper_stock
  belongs_to :press
  
  has_many :notes, :as => :notable
  has_many :costs, :as => :costable
  has_one :press_schedule

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
  def ups
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

  def sell_price(markup = self.stock_sell_percent)
    markup = 1 + markup 
    return (self.paper_stock.company_cost * markup).round(2)
  end

  def cost(order_quantity)
    set = self.order.cost_set
    q_ordered = self.quantity_ordered( order_quantity )
    q_allowed = q_ordered + (make_ready_sheets( q_ordered ))

    sides = self.sides
    coverage = self.coverage
    
    prices = {}
    #prices["plates"] = color_count * 50 # This is a cheat. Choose a plate machine, then get this price later

    #puts "Checking prepress prices: #{self.order.cost_set.id} #{self.id} nil"
    prices["prepress"] = prepress.cost(self.order.cost_set_id, self.id, nil)
    prices["press"] = press.cost(self.order.cost_set, self.id, nil)
    prices["paper"] = self.paper_stock.cost( :out => self.out, :quantity => q_allowed, :adjustment => 0.25 )

    #puts "prices: #{prices}"
    sum = prices["prepress"] + prices["press"] + prices["paper"] 
    puts "Total for #{q_ordered}: #{sum.round(2)}"



    return sum.round(2)
  end

  def coverage
    self.ink_coverage
  end

  def color_count
    ink_side_1 + ((ink_side_2.nil? or self.layout == "work-and-turn")? 0 : ink_side_2)
  end

  def sides
    return 2 if ink_side_1 > 0 and ink_side_2 > 0
    return 1
  end

  def make_ready_sheets(quantity)
    mr = 0
=begin
       Once costs and named scopes are setup
       self.costs.bindery.each do { |c| mr += 100 }
=end
    # 100 Per color Per Side
    mr += color_count * 100
    mr += spoilage * quantity
  end

  def spoilage
    return 0.050 if ink_coverage == "light"
    return 0.070 if ink_coverage == "medium"
    return 0.085 if ink_coverage == "medium_heavy"
    return 0.100 if ink_coverage == "heavy"
  end

  def quantity_ordered(quantity_ordered)
    puts "Quantity Ordered: #{quantity_ordered} #{self.quantity_per_order}"
    quantity_ordered.to_i * self.quantity_per_order.to_i
  end

  # Dummy method for now
  def prepress
    self.order.job.client.company.prepress
  end
end
