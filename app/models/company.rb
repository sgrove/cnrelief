class Company < ActiveRecord::Base
  has_many :clients
  has_many :jobs, :through => :clients
  has_many :contacts, :through => :clients
  has_many :phone_numbers, :as => :phoneable
  has_many :addresses, :as => :addressable
  has_many :employees, :class_name => "User"
  has_many :presses

  def to_s
    self.name
  end

  def orders
    self.jobs.collect(&:orders).flatten
  end
end
