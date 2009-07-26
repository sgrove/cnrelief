class User < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :user_groups
  has_many :contacts, :as => :contactable
  has_many :addresses, :through => :contacts
  has_many :phone_numbers, :through => :contacts

  default_scope :order => "created_at ASC"
  
  acts_as_authentic do |c|
    c.validate_login_field = false
    c.login_field = :email
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instruction(self)
  end

  def full_name
    c = self.primary_contact
    return "#{c.first} #{c.last}" unless c.nil? or c.count == 0
    self.login
  end

  def full_name=(name)
    name = name.split(" ")
    c = self.primary_contact
    c.first = name[0]
    c.last = name[1]
    c.save
  end

  def to_s
    contact = self.contacts.primary.first
    return contact.full_name unless contact.nil?
    self.login
  end

  def primary_contact
    self.contacts.primary
  end
end
