class CostSet < ActiveRecord::Base
  belongs_to :company
  has_many :orders
  has_many :costs

  validates_uniqueness_of :name, :scope => :company_id, :message => "Sorry, you already have a cost set with that name"
end
