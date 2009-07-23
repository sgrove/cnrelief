class Section < ActiveRecord::Base
  belongs_to :order
  belongs_to :paper_stock
  belongs_to :press
  
  has_many :notes, :as => :notable
  has_one :press_schedule

  # What to do about the quantities?

  def populate_page_sizes_by_order
    self.parent_size = self.order.parent_size
    self.press_size = self.order.press_size
  end

  def ups
    # Define number of times we can print job on a given page size
    # Calculate: (press_sheet_size.horizontal / finish_flat_size.horizontal) *
    #            (press_sheet_size.vertical / finish_flat_size.vertical)
    # [23x17.5 -> 3x5]: [(23 / 3) * (17.5 * 5)].round (cut off decimal might be better..)
    # (7.666).truncate * (3.5).truncate

    parent = self.paper_stock.parent_sheet
    x, y = parent.downcase.split("x")

    ps = parent
    x2, y2 = x.to_f, y.to_f / self.out

    fs = self.order.finish_flat_size
    x3, y3 = fs.split("x")

    return (x2.to_f / x3.to_f).truncate * (y2.to_f / y3.to_f).truncate
  end

  def sell_price(markup = self.stock_sell_percent)
    markup = 1 + markup 
    return (self.paper_stock.company_cost * markup).round(2)
  end
end
