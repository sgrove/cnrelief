Given /^the following campaigns:$/ do |users|
  User.create!(users.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) campaign$/ do |pos|
  visit campaigns_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following campaigns:$/ do |users|
  campaign.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end

Given /^that I have (\d+) campaigns$/ do |amount|
  amount.times do |counter|
    Campaign.create(:title => "Campaign #{counter}", :copy1 => "A full phrase 1", :copy2 => "A full phrase 2", :size => "medium", :status => "pending")
  end
end

Given /^that "([^\"]*)" has a status of "([^\"]*)"$/ do |title, status|
  campaign = Campaign.find_by_title(title)
  campaign.status = status
  campaign.save
end

When /^I create a valid campaign "([^\"]*)"$/ do |arg1|
  pending
end

