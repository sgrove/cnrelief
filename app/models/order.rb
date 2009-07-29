class Order < ActiveRecord::Base
  belongs_to :job
  belongs_to :estimator, :class_name => "User"
  belongs_to :csr, :class_name => "User"
  belongs_to :quoter, :class_name => "User"
  belongs_to :biller, :class_name => "User"
  belongs_to :contact
  has_many :sections
  has_many :notes
  has_many :quantities

  accepts_nested_attributes_for :sections, :allow_destroy => true


  # Plugins - auditing, comments, paperclip for multiple files

  def populate_by_job(job=self.job)
    self.estimator = job.estimator
    self.csr = job.csr
    self.quoter = job.quoter
    self.contact = job.contact
  end

end
