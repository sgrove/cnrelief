class User < ActiveRecord::Base
  belongs_to :company
  belongs_to :user_group

  has_one :contact, :as => :contactable
  has_one :address, :as => :addressable
  has_many :phone_numbers, :through => :contacts

  default_scope :order => "created_at ASC"
  
  acts_as_authentic do |c|
    c.validate_login_field = false
    c.login_field = :email
  end

  # Sets the user's address from a hash. Bit of a hack for nested resources
  def set_address=(hash)
    a = Address.new(hash)
    a.addressable = self
    a.save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instruction(self)
  end

  def full_name
    c = self.primary_contact.full_name
    return c unless c.nil? or c == ""
    self.login
  end

  def full_name=(name)
    self.primary_contact.full_name = name
  end

  def to_s
    contact = self.contact
    return contact.full_name unless contact.nil? 
    self.login
  end

  def primary_contact
    c = self.contact
  end

  def has_permission_to?(action)
    self.permissions.split(',').include?(action)
  end

  def permissions
    self.group.permissions
  end
end
