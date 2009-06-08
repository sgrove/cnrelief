Feature: Campaign Management
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: View existing campaigns
    Given that I am logged in as "abby@abtabular.com"
    When I go to the dashboard page
    And I follow "New campaign"
    And I submit a valid campaign "Front page copy"
    Then I should see "Front page copy"
    And I should see "Great, schedule my campaign!"

  Scenario: Create new campaign
    Given that I am logged in as "abby@abtacular.com"
    When I go to the dashboard page
    And I follow "New Campaign"
    And I fill in "title" with "Borderline technofetishism"
    And I fill in "copy1" with "These new macbooks look great!"
    And I fill in "copy2" with "OMG I luv apple jobz hav my 1st children plz lolz!"
    And I select "Medium" from "campaign_size"
    And I press "Create campaign"
    Then I should see "Here's what your campaign will look like"
    And I should see "These new macbooks look great!"
    And I should see "OMG I luv apple jobz hav my 1st children plz lolz!"
    And I should see "We will run a medium size campaign, which will give a response reliablity of p = 0.5"
    When I follow "Great, schedule my campaign!"
    Then I should see "Your campaign is scheduled, you should have the results shortly!"
    And I should see "Borderline technofetishism"
    And I should see "Scheduled"
  
  Scenario: Campaign details must be filled out
    Given that I am logged in as "abby@abtacular.com"
    When I go to the dashboard page
    And I follow "New Campaign"
    And I press "Create campaign"
    Then I should see "Missing Phrase 1"
    And I should see "Missing Phrase 2"
    When I fill in "copy1" with "Copy 1"
    And I fill in "copy2" with "Copy 2"
    And I fill in "title" with "Fully fleshed out campaign"
    And I select "Small" from "campaign_size"
    And I press "Create campaign"
    Then I should see "Here's what your campaign will look like"

  Scenario: Campaign titles must be unique per user
    Given that I am logged in as "abby@abtabular.com"
    When I go to the dashboard page
    And I follow "New campaign"
    And I submit a valid campaign "Unique campaign #1"
    When I go to the dashboard page
    And I follow "New campaign"
    And I submit a valid campaign "Unique campaign #1"
    Then I should see "You already have a campaign with that title, choose a new one."
    When I fill in "title" with "Unique campaign #2"
    And I press "Create Campaign"
    Then I should see "Unique campaign #2"
    And I should see "Great, schedule my campaign!"
    When I go to the dashboard page
    Then I should see "Unique campaign #1"
    And I should see "Unique campaign #2"

  Scenario: Campaigns have statuses
    Given that I am logged in as "abby@abtacular.com"
    Given that I have 4 campaigns
    Given that "Campaign 1" has a status of "scheduled"
    Given that "Campaign 2" has a status of "running"
    Given that "Campaign 3" has a status of "complete"
    Given that "Campaign 4" has a status of "no funds"
    When I go to the dashboard page
    Then I should see the following campaigns:
      |Campaign Title|Status|Results|
      |Campaign 1|Scheduled|Not ready yet|
      |Campaign 2|Running|In progress|
      |Campaign 3|Complete|Click to view|
      |Campaign 4|No funds|Please recharge your account|

  Scenario: Delete a campaign
    Given that I am logged in as "abby@abtacular.com"
    Given that I have 4 campaigns
    When I go to the dashboard page
    When I delete the 3rd campaign
    Then I should see the following campaigns:
      |Campaign Title|Status|Results| 
      |Campaign 1|Idle|Not ready yet|
      |Campaign 2|Idle|Not ready yet|
      |Campaign 4|Idle|Not ready yet|
    And I should see "Campaign 3 has been deleted, but we'll keep the results (if any) for up to 30 days"
