Given /^a company named "([^\"]*)"$/ do |name|
  c = Company.new
  c.name = name.downcase
  c.save
end

Given /I am logged in as estimator "(.*)@(.*).com"/ do |login, company|
  c = Company.find_by_name( company.downcase )
  e = c.employees.create(:login => login)
  e.create_user(:password => "s3cr3t")

  login_user(:email => @email, :password => "s3cr3t")
end

Given /^user "(.*)" belongs to the employee group "([^\"]*)"$/ do |login, group|
  set_employee_group( @me.login, group)
end

Given /^I belong to the employee group "([^\"]*)"$/ do |group|
  set_employee_group( @me.login, group)
end

# Supporting methods
def set_employee_group(login, group)
  e = Employee.find_by_login( login )
  e.employee_group = group
  e.save
end
