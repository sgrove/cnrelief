class User < ActiveRecord::Base
  default_scope :order => "created_at ASC"
  
  acts_as_authentic do |c|
    c.validate_login_field = false
    c.login_field = :email
  end

  def full_name
    self.login
  end

  def full_name=(name)
    name = name.split(" ")
    self.first_name = name.first
    self.last_name = name.last
  end
end
