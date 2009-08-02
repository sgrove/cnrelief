class Press < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable

  def cost(cost_set_id, section_id, order_quantity)
    runtime = self.calculate_runtime(Section.find(section_id), :quantity => order_quantity)

    puts "runtime: #{runtime}, generating cost..."
    return runtime * self.costs("hourly", Section.find(section_id).order.cost_set_id).cost
  end

  def costs(kind, cost_set_id)
    cs = CostSet.find( cost_set_id )
    cost = cs.costs.press_costs( self.id ).named( kind ).first
  end

  def calculate_runtime(section, options={})
    coverage = section.coverage
    paper_stock = section.paper_stock

    puts "Generating quantity to run..."
    quantity = section.quantity_ordered(options[:quantity])

    puts "getting color_count..."
    color_count = section.color_count

    puts "Arguments: #{options}"

    minutes = 0.0
    puts "Minutes: #{minutes}"

    # Washup
    minutes += self.washup_initial_minutes # Always need the initial washup
    minutes += self.washup_additional_minutes * (color_count - 1) # X minutes for each additional color
    puts "Minutes: (#{self.washup_initial_minutes} + (#{self.washup_additional_minutes} * (#{color_count} - 1)) = #{minutes}"

    # Setup
    minutes += self.plate_initial_minutes # Always need initial setup
    minutes += self.plate_additional_minutes * (color_count - 1) # Y minutes for each additional color
    puts "+ (#{self.plate_initial_minutes} + (#{self.plate_additional_minutes} * (#{color_count} - 1))"

    # Run rate
    minutes += (quantity / self.run_rate( coverage)) * 60
    puts "+ #{quantity} / #{self.run_rate( coverage )} = #{quantity / self.run_rate( coverage )}"
    puts "Minutes: #{minutes}"

    return minutes / 60
  end

  def run_rate(coverage)
    speeds = JSON.parse(self.run_rates)

    if speeds.has_key? 'Error'
      raise 'JSON Encoding error in press run rate.'
    end

    return speeds[coverage]
  end
end
