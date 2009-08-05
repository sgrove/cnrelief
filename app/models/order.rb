class Order < ActiveRecord::Base
  belongs_to :job
  belongs_to :estimator, :class_name => "User"
  belongs_to :csr, :class_name => "User"
  belongs_to :quoter, :class_name => "User"
  belongs_to :biller, :class_name => "User"
  belongs_to :contact
  belongs_to :cost_set
  has_many :sections
  has_many :notes, :dependent => :destroy
  has_many :quantities, :dependent => :destroy

  # overs_on_shelf, quantities, final_quantity, quantity_ordered, consecutive_start,
  # estimator_id, due_by, quoted_on, csr_id, ordered_on, finish_flat_size, consecutive_end,
  # finish_fold_size, status, sections_attributes

  attr_accessible :overs_on_shelf, :quantities, :final_quantity, :quantity_ordered, :layout
  attr_accessible :consecutive_start, :estimator_id, :csr_id, :finish_flat_size, :finish_fold_size
  attr_accessible :due_by, :quoted_on, :ordered_on, :consecutive_end, :status, :sections_attributes, :cost_set_id, :quantities_attributes

  accepts_nested_attributes_for :sections, :allow_destroy => true
  accepts_nested_attributes_for :quantities, :allow_destroy => true

  # Plugins - auditing, comments, paperclip for multiple files

  def populate_by_job(job=self.job)
    self.estimator = job.estimator
    self.csr = job.csr
    self.quoter = job.quoter
    self.contact = job.contact
  end

  def company
    self.job.client.company
  end

  def cost(quantity)
    sections.each.inject(0) { |sum, section| sum + section.cost(quantity) }
  end
end
