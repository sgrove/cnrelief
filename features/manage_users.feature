Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Name" with "name 1"
    And I fill in "Color" with "color 1"
    And I fill in "Description" with "description 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "color 1"
    And I should see "description 1"

  Scenario: Delete user
    Given the following users:
      |name|color|description|
      |name 1|color 1|description 1|
      |name 2|color 2|description 2|
      |name 3|color 3|description 3|
      |name 4|color 4|description 4|
    When I delete the 3rd user
    Then I should see the following users:
      |name|color|description|
      |name 1|color 1|description 1|
      |name 2|color 2|description 2|
      |name 4|color 4|description 4|
