class Company < ActiveRecord::Base
  has_many :clients
  has_many :jobs, :through => :clients
  has_many :contacts, :through => :clients
  has_many :phone_numbers, :as => :phoneable
  has_many :addresses, :as => :addressable
  has_many :employees
  has_many :presses, :class_name => "Press"

  def to_s
    self.name
  end

  def orders
    self.jobs.collect(&:orders).flatten
  end
end
