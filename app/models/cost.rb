class Cost < ActiveRecord::Base
  belongs_to :cost_set
  belongs_to :costable, :polymorphic => true

  named_scope :press_costs, lambda { |*args| {:conditions => ["costable_type = 'Press' AND costable_id = ?", args.first]} }
  named_scope :named, lambda { |*args| {:conditions => ["LOWER(name) = ?", args.first.downcase] } }
  named_scope :prepress_costs, lambda { |*args| {:conditions => ["costable_type = 'Prepress' AND costable_id = ?", args.first]} }
  named_scope :bindery_costs, lambda { |*args| {:conditions => ["costable_type = 'Bindery' AND costable_id = ?", args.first]} }
  named_scope :letterpress_costs, lambda { |*args| {:conditions => ["costable_type = 'Letterpress' AND costable_id = ?", args.first]} }
  

  validates_uniqueness_of :name, :scope => [:costable_id, :costable_type], :message => "Sorry, this item already has a cost with that name"

  def price(quantity=0)
    return cost unless variable_on_quantity?
    cost * (quantity / 1000)
  end

  def variable_on?(axis)
    self.variable_on == axis
  end

  def to_f
    self.cost
  end
end
