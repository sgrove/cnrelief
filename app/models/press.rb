class Press < ActiveRecord::Base
  belongs_to :company
  has_many :press_costs
end
