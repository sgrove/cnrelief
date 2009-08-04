class Letterpress < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable

  def cost(options={})
    debug = options[:debug] || false
    cost_set = options[:cost_set]
    quantity = options[:quantity]
    ups = options[:ups]
    charges = options[:charges]

    sum = 0.0

    charges.each do |category, actions|
      actions.each do |index, value|

        cost = cost_set.costs.letterpress_costs( self.id ).named( index.to_s ).first

        puts "#{index} not found in letterpress costs" if cost.nil? and debug

        unless cost.nil?
          # Different types of cost for letterpress: Fixed, Quantity.

          if cost.variable_on? "quantity"
            puts "#{index} will be #{cost.cost}/1000pcs. #{cost.cost * (quantity / 1000.0)}" if debug
            sum += cost.cost * (quantity / 1000.0)
          end

          if cost.variable_on? "fixed"
            puts "#{index} will be #{cost.cost} (fixed)" if debug
            sum += cost.cost
          end
        end
      end
    end

    return sum
  end

end
