class UserGroup < ActiveRecord::Base
  belongs_to :company
  has_many :users

  validates_presence_of :name

  def to_s
    self.name
  end
end
