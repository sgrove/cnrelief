class Cost < ActiveRecord::Base
  belongs_to :costable, :polymorphic => true
  validates_uniqueness_of :name, :scope => :category

  def price(quantity=0)
    return cost unless variable_on_quantity?
    cost * (quantity / 1000)
  end
end
