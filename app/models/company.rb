class Company < ActiveRecord::Base
  has_many :clients
  has_many :jobs, :through => :clients
  has_many :contacts, :through => :clients
  has_many :phone_numbers, :as => :phoneable
  has_many :addresses, :as => :addressable
  has_many :employees, :class_name => "User"
  has_many :presses
  has_many :user_groups
  has_many :cost_sets

  has_one :prepress

  def to_s
    self.name
  end

  def orders
    self.jobs.collect(&:orders).flatten
  end

  def groups
    self.user_groups
  end

  # group_name should not include the company prefix
  def add_employee_to_group(employee_id, group_name)
    g = self.user_groups.find_by_name("#{self.name}_#{group_name}")
    

    e = self.employees.find(employee_id)
    puts "Adding #{e} to #{g}"
    return false if g.nil? or e.nil?

    e.user_group = g
    return e.save
  end

  # Just an alias for Company.user_groups
  def create_default_groups!
    # Define groups and their permissions
    groups = []

    groups << ["#{self.name}_admins",
               "show_company, modify_company, destroy_company,
               list_employees, create_employee, show_employee, modify_employee, delete_employee,
               list_clients, create_client, show_client, modify_client, delete_client,
               list_orders, create_orders, show_orders, modify_orders, delete_orders"]

    groups << ["#{self.name}_managers",
               "list_employees, create_employee, show_employee, modify_employee, delete_employee,
               list_clients, create_client, show_client, modify_client, delete_client,
               list_orders, create_orders, show_orders, modify_orders, delete_orders"]

    groups << ["#{self.name}_estimators",
               "list_clients, create_client, show_client, modify_client,
               list_orders, create_orders, show_orders, modify_orders"]

    groups << ["#{self.name}_csrs",
               "list_clients, show_client, modify_client,
               list_orders, create_orders, show_orders, modify_orders"]

    groups.each do |group|
      logger.debug "Creating group #{group[0]} with permission set:"
      logger.debug group[1].gsub('\n','').gsub(/\s+/,'')
      self.user_groups.create(:name => group[0], :permissions => group[1].gsub('\n','').gsub(/\s+/,''))
    end
    
  end

  def save
    new = self.new_record?
    super
    create_default_groups! if new
  end
end
