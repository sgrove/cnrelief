Given /^the following campaigns:$/ do |users|
  User.create!(users.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) campaign$/ do |pos|
  visit campaigns_url
  within("#campaign-list > div:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

Then /^I should see the following campaigns:$/ do |campaigns|
  campaigns.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("#campaign-list > div.campaign-list-entry:nth-child(#{i+1}) > span:nth-child(#{j+1})") {  |span|
        span.inner_text.should == cell
      }
    end
  end
end

Given /^that I have (\d+) campaigns$/ do |amount|
  amount.to_i.times do |counter|
    c = Campaign.create(:title => "Campaign #{counter + 1}", :copy1 => "A full phrase 1", :copy2 => "A full phrase 2", :size => "medium", :user => @me)
  end
end

Given /^that "([^\"]*)" has a status of "([^\"]*)"$/ do |title, status|
  campaign = Campaign.find_by_title(title)
  campaign.status = status
  campaign.save
end

When /^I create a valid campaign "([^\"]*)"$/ do |title|
  campaign = Campaign.create(:title => title, :copy1 => "This is a valid copy1", :copy2 => "This is a valid copy2", :size => "small", :status => "pending")  
end

When /^I submit a valid campaign "([^\"]*)"$/ do |title|
  fill_in("title", :with => title)
  fill_in("copy1", :with => "These new macbooks look great!")
  fill_in("copy2", :with => "OMG I luv apple jobz hav my 1st children plz lolz!")
  select("Medium", :from => "campaign_size")
  click_button("Create campaign")
end

