Given /^the following workers:$/ do |workers|
  Worker.create!(workers.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) worker$/ do |pos|
  visit workers_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following workers:$/ do |workers|
  workers.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
