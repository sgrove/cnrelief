class Quantity < ActiveRecord::Base
  belongs_to :order
  has_many :notes, :as => :notable
end
