class PaperStock < ActiveRecord::Base
  belongs_to :company
  
  # Has notes: description, unit_description
  has_many :notes, :as => :notable

  # Cheating for now, add in later
  # belongs_to :cost_set

  def description
    return self.notes.find_by_name("description")
  end

  def cost(options={})
    debug = options[:debug] || false
    puts "PaperStock Args: #{options}" if debug
    cost = (self.company_cost.to_f / options[:out]) * (options[:quantity] / 1000.0)
    cost += cost.to_f * options[:adjustment]

    if debug
      puts "PaperCost: (#{self.company_cost} / #{options[:out]}) * (#{options[:quantity]} / 1000)"
      puts "Adjusted (#{options[:adjustment] * 100}%): #{cost}"
    end

    return cost
  end
end
