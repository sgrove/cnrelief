class Contact < ActiveRecord::Base
  belongs_to :contactable, :polymorphic => true
  has_one :address
  has_many :phone_numbers, :as => :phoneable

  named_scope :primary, :conditions => ["name = 'primary'"]

  def full_name
    return "#{first} #{last}"
  end
end
