class Contact < ActiveRecord::Base
  belongs_to :contactable, :polymorphic => true
  has_one :address, :as => :addressable
  has_many :phone_numbers, :as => :phoneable

  accepts_nested_attributes_for :address, :allow_destroy => true

  named_scope :primary, :conditions => ["name = 'primary'"]

  def full_name
    return "#{first} #{last}"
  end

  # Warning: Bang method. Causes record to be saved
  def full_name=(name)
    name = name.split(" ")
    first = name[0]
    last = name[1]
    self.save
  end
end
