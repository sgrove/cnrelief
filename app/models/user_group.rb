class UserGroup < ActiveRecord::Base
  belongs_to :company
  has_many :users

  validates_presence_of :name
end
