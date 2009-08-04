class UserGroup < ActiveRecord::Base
  belongs_to :company
  has_many :users

  named_scope :named, lambda { |*args| {:conditions => ["LOWER(name) = ?", args.first.downcase] } }

  validates_presence_of :name

  def to_s
    self.name.split('_')[1].capitalize
  end
end
