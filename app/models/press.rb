class Press < ActiveRecord::Base
  serialize :run_rates, Hash
  belongs_to :company
  has_many :costs, :as => :costable

  default_scope :order => "created_at ASC"

  def to_s
    name
  end

  def cost(options={}) # cost_set_id, section_id, order_quantity
    runtime = self.calculate_runtime(options)

    #puts "runtime: #{runtime}, generating cost..."
    return runtime * self.costs("hourly", options[:cost_set].id).cost
  end

  def costs(kind, cost_set_id)
    cs = CostSet.find( cost_set_id )
    cost = cs.costs.press_costs( self.id ).named( kind ).first
  end

  def calculate_runtime(options={})
    debug = options[:debug] || false
    puts "Runtime args: #{options}" if debug

    coverage = options[:coverage]
    paper_stock = options[:paper_stock]

    puts "Generating quantity to run..." if debug

    quantity = options[:quantity_ordered]

    puts "Quantity: #{quantity} (from #{options[:quantity]})" if debug

    puts "getting color_count..." if debug
    color_count = options[:color_count]


    minutes = 0.0

    # Washup
    minutes += self.washup_initial_minutes # Always need the initial washup
    minutes += self.washup_additional_minutes * (color_count - 1) # X minutes for each additional color

    puts "Minutes: (#{self.washup_initial_minutes} + (#{self.washup_additional_minutes} * (#{color_count} - 1)) = #{minutes}" if debug

    # Setup
    minutes += self.plate_initial_minutes # Always need initial setup
    minutes += self.plate_additional_minutes * (color_count - 1) # Y minutes for each additional color
    puts "+ (#{self.plate_initial_minutes} + (#{self.plate_additional_minutes} * (#{color_count} - 1))" if debug
    puts "#{minutes} minutes of setup/washup time for this job." if debug

    # Run rate
    minutes += (quantity.to_f / run_rates[coverage.to_sym].to_f) * 60.0
    puts "+ #{quantity.to_f} / #{run_rates[:coverage.to_sym].to_f} = #{quantity.to_f / run_rates[coverage].to_f}" if debug
    puts "Minutes: #{minutes}" if debug

    return minutes / 60.0
  end

end


