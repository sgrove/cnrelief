class Press < ActiveRecord::Base
  belongs_to :company
  has_many :costs, :as => :costable
end
