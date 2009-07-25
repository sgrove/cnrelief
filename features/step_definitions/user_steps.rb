Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_url
  within("#user_listing > div:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

Then /^I should see the following users:$/ do |users|
  users.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("#user_listing > div:nth-child(#{i+1}) > span") { |span|
        puts "span- [actual:expected]: #{span.inner_text} : #{cell}"
        span.inner_text.should == cell
      }
    end
  end
end

When 'I log in with bad credentials' do
  fill_in("login", :with => 'this_is_a_crazy_username')
  fill_in("password", :with => 'this_is_a_loong_password')

  click_button("Login")
end
