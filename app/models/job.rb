class Job < ActiveRecord::Base
  has_many :orders

  belongs_to :client

  belongs_to :estimator, :class_name => "Employee", :foreign_key => "estimator_id"
  belongs_to :quoter, :class_name => "Employee", :foreign_key => "quoter_id"
  belongs_to :csr, :class_name => "Employee", :foreign_key => "csr_id"
  belongs_to :contact, :class_name => "Contact", :foreign_key => "contact_id"

  def to_s
    "[#{self.client}]:[#{self.number}]"
  end

end
