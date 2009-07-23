class PaperStock < ActiveRecord::Base
  # Has notes: description, unit_description
  has_many :contacts, :as => :contactable
  has_many :notes, :as => :notable

  def description
    return self.notes.find_by_name("description")
  end
end
