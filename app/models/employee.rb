class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :employee_group
  has_many :contacts, :as => :contactable
  has_many :addresses, :through => :contacts
  has_many :phone_numbers, :through => :contacts

  def to_s
    contact = self.contacts.primary.first
    return contact.full_name unless contact.nil?
    self.username
  end
end
