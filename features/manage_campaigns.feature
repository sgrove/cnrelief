Feature: Campaign Management
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: View existing campaigns
    Given that I am logged in as "abby"
    When I go to the dashboard page
    And I follow "New campaign"
    And I create a valid campaign "Front page copy"
    Then I should see "Front page copy"
    And I should see "Ready to submit"

  Scenario: Create new campaign
    Given that I am logged in as "abby"
    When I go to the dashboard page
    And I follow "New Campaign"
    And I fill in "title" with "Borderline technofetishism"
    And I fill in "copy1" with "These new macbooks look great!"
    And I fill in "copy2" with "OMG I luv apple jobz hav my 1st children plz lolz!"
    And I select "medium" from "size"
    And I follow "Show my what my campaign will look like"
    Then I should see "Here's what your campaign will look like"
    And I should see "These new macbooks look great!"
    And I should see "OMG I luv apple jobs hav my 1st children plz lolz!"
    And I should see "We will run a medium size campaign, which will give a response reliablity of p = 0.5"
    When I follow "Great, schedule my campaign!"
    Then I should see "Your campaign is scheduled, you should have the results shortly!"
    And I should see "Borderline technofetishism"
    And I should see "Scheduled to run"
  
  Scenario: Campaign details must be filled out
    Given that I am logged in as "abby"
    When I go to the dashboard page
    And I follow "New Campaign"
    And I follow "Show my what my campaign will look like"
    Then I should see "Wow, looks like there were some errors."
    And I should see "Must have at least two phrases to compare."
    And I should see "Missing phrase 1"
    And I should see "Missing phrase 2"
    And I should see "Please choose a campaign size"
    When I fill in "copy1" with "Copy 1"
    And I fill in "copy2" with "Copy 2"
    And I select "small" from "size"
    And I follow "Great, show me what my campaign should look like"
    Then I should see "Here's what your campaign will look like"

  Scenario: Campaigns have statuses
    Given that I am logged in as "abby"
    Given that I have 4 campaigns
    Given that "campaign 1" has a status of "scheduled"
    Given that "campaign 2" has a status of "running"
    Given that "campaign 3" has a status of "completed"
    Given that "campaign 4" has a status of "nofunds"
    When I go to the dashboard page
    Then I should see the following campaigns:
      |Campaign Title|Status|Results|
      |Campaign 1|Scheduled|Not ready yet|
      |Campaign 2|Running|Not ready yet|
      |Campaign 3|Complete|Click to view|
      |Campaign 4|Insufficient funds|Click here to recharge your account|

  Scenario: Delete a campaign
    Given that I am logged in as "abby"
    Given that I have 4 campaigns
    When I go to the dashboard page
    And I follow "Manage Campaigns"
    When I delete the 3rd campaign
    Then I should see the following campaigns:
      |Campaign Title|Status|Results| 
      |Campaign 1|Scheduled|Not ready yet|
      |Campaign 2|Scheduled|Not ready yet|
      |Campaign 4|Scheduled|Not ready yet|
    And I should see "Campaign 3 has been deleted, but we'll keep the results (if any) for up to 30 days"
