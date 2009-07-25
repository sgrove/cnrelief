class Client < ActiveRecord::Base
  has_many :contacts, :as => :contactable
  has_many :addresses, :as => :addressable
  has_many :jobs
  has_many :orders, :through => :jobs

  def to_s
    self.name
  end
end
