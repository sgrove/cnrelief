class PaperStock < ActiveRecord::Base
  # Has notes: description, unit_description
  has_many :notes, :as => :notable

  # Cheating for now, add in later
  # belongs_to :cost_set

  def description
    return self.notes.find_by_name("description")
  end

  def cost(options={})
    cost = (self.company_cost / options[:out]) * (options[:quantity] / 1000)
    puts "PaperCost: (#{self.company_cost} / #{options[:out]}) * (#{options[:quantity]} / 1000)"
    cost += cost * options[:adjustment]
    puts "Adjusted (#{options[:adjustment] * 100}%): #{cost}"
    return cost
  end
end
