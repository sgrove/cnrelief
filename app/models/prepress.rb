class Prepress < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable

  def cost(cost_set_id, section_id, options={})
    cost_set = CostSet.find cost_set_id
    section = Section.find section_id

    sum = 0.0

    charges = JSON.parse(section.prepress_costs)

    charges.each do |index, value|
      cost = cost_set.costs.prepress_costs( self.id ).named( index.to_s ).first
      puts "#{index} will be #{cost.cost}/hr for #{value / 60.0} hours, = #{cost.cost * value / 60.0}"

      sum += cost.cost * (value / 60.0) unless cost.nil?
    end

=begin
    # Temporary while building this code
    options[:cost_list].each do |index, value|
      cost = cost_set.costs.prepress_costs( self.id ).named( index.to_s ).first
      puts "#{index} will be #{cost.cost}/hr for #{value / 60.0} hours, = #{cost.cost * value / 60.0}"

      sum += cost.cost * (value / 60.0) unless cost.nil?
    end
=end
    return sum
  end

end
