class Platemachine < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable

  def cost(cost_set_id, section_id, options={})
    cost_set = CostSet.find cost_set_id
    section = Section.find section_id

    sum = 0.0

    charges = section.color_count * 50

    return sum
  end
end
