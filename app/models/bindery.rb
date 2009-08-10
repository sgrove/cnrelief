class Bindery < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable

  def cost(options={})
    debug = options[:debug] || false
    puts "Bindery args: #{options}" if debug

    cost_set = options[:cost_set]
    ups = options[:ups]
    charges = options[:charges]

    return 0 if charges.nil?

    sum = 0.0

    charges.each do |category, pairs|
      pairs.each do |index, value|
        # Summing logic depends on the cost variable_on field

        cost = cost_set.costs.bindery_costs( self.id ).named( index.to_s.gsub('_', ' ') ).first

        puts "#{category} #{index} found, parsing..." if debug unless cost.nil?

        puts "#{category} #{index} cost not found for bindery" if cost.nil? and debug

        unless cost.nil?
          if debug
            puts "Cost:"
            puts "  Name:  #{cost.name}"
            puts "  Cost: $#{cost.cost}"
            puts "  VO:    #{cost.variable_on}"
          end

          if cost.variable_on? "fixed"
            puts "#{category} #{index} is fixed at $#{cost.cost}" if debug
            sum += cost.cost
          elsif cost.variable_on?("quantity") or  cost.variable_on?("quantity_ordered")
            puts "#{category} #{index} is variable on ordered $#{cost.cost}/1000 => $#{cost.cost * options[:quantity] / 1000.0 / ups}" if debug
            sum += cost.cost * options[:quantity] / 1000.0 / ups
          elsif cost.variable_on? "quantity_required"
            puts "#{category} #{index} is variable on allowed $#{cost.cost}/1000 => $#{cost.cost * options[:quantity] / 1000.0 / ups}" if debug
            sum += cost.cost * options[:quantity] / 1000.0 / ups
          else
            puts "I don't know what to do with #{category} #{index}, variable on #{cost.variable_on} for $#{cost.cost} => $#{cost.cost * options[:quantity] / 1000.0}" if debug
          end
        end
      end

    end

    return sum
  end
end
