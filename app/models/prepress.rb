class Prepress < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable

  def cost(options={})
    debug = options[:debug] || false

    puts "Prepress Args: #{options}" if debug
    cost_set = options[:cost_set]

    sum = 0.0

    charges = options[:charges]

    return 0 if charges.nil?
    
    charges.each do |index, value|
      cost = cost_set.costs.prepress_costs( self.id ).named( index.to_s ).first
      puts "Cost #{index} not found!" if cost.nil?


      unless cost.nil?
        if cost.variable_on? "hourly"
          puts "#{index} will be #{cost.cost}/hr for #{value / 60.0} hours, = #{cost.cost * value / 60.0}" if debug
          sum += cost.cost * (value / 60.0)
        end

        if cost.variable_on? "quantity"
          puts "#{index} will be #{cost.cost}/pcs for #{value / 60.0} pcs, = #{cost.cost * value}" if debug
          sum += cost.cost * value
        end
      end

    end

    return sum
  end

end
