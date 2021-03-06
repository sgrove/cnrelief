require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field) 
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time 
When /^I select "([^\"]*)" as the date and time$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or 
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
When /^I select "([^\"]*)" as the "([^\"]*)" date and time$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it. 
When /^I select "([^\"]*)" as the time$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^I select "([^\"]*)" as the "([^\"]*)" time$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^I select "([^\"]*)" as the date$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^I select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end

When /^I check "([^\"]*)"$/ do |field|
  check(field) 
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field) 
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Then /^I should see "([^\"]*)"$/ do |text|
  response.should contain(text)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  response.should_not contain(text)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should_not =~ /#{value}/
end
    
Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end

Then /^I should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end


# cnrelief additions
Given 'I am not logged in' do
end

Given 'I am logged in' do
  login_user :email => "test_user@cnrelief.com"
end
  
Given /^I am logged in as "(.*)"$/ do |email|
  login_user :email => email
end

Given 'a user' do
  create_user
end  

Given /^a user "(.*)"$/ do |email|
  create_user :email => email
end

Then 'the response should be 404' do
  response.code.should == '404'
end

def create_user(options={})
  options[:email] ||= "test_user@cnrelief.com"
  options[:password] ||= "s3cr3t"
  
  @user = User.create(:email => options[:email], :password => options[:password], :password_confirmation => options[:password], :full_name => "Printprint Good")
end
  
def login_user(options={})
  options[:email] ||= "test_user@cnrelief.com"
  options[:password] ||= "s3cr3t"

  unless @me
    create_user :email => options[:email]
    @me = @user
  end

  post "/user_sessions", :user_session => { :email => @me.email, :password => @me.password }
  #follow_redirect!
end

# cnrelief added steps below

# Randomize the fields based company_name + field hashed? Keep in mind
When /^I submit a valid company named "([^\"]*)"$/ do |name|
  fill_in("company_name", :with => "MiloStudy")
  fill_in("company_address_1", :with => "2219 Piedmont Ave.")
  fill_in("company_city", :with => "Berkeley")
  select( "California", :from => "company_state")
  fill_in "company_zip", :with => "94720"

  fill_in "company_contact_name", :with => "Milo Ceville"
  fill_in "company_contact_phone", :with => "949-555-1210"
  fill_in "company_contact_cell", :with => "949-555-1211"
  fill_in "company_contact_fax", :with => "949-555-1212"
  fill_in "company_contact_email", :with => "mceville@milostudy.com"

  follow "create"
end
