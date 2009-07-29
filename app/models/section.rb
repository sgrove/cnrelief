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
  validates_inclusion_of :layout, :in => %w( one-sided perfect sheet-wise work-in-turn work-in-tumble), :message => "Sorry, I don't recognize '{{value}}' as a valid layout."

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

  def price(quantity)
    total = 0
    all_costs = self.costs
    all_costs << self.press.costs

    puts all_costs

    all_costs.each do |cost|
      total += cost.price(quantity)
    end

    return total
  end
end
