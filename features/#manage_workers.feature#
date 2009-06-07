Feature: Manage workers
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new worker
    Given I am on the new worker page
    When I fill in "Age" with "age 1"
    And I fill in "Gender" with "gender 1"
    And I fill in "Location" with "location 1"
    And I press "Create"
    Then I should see "age 1"
    And I should see "gender 1"
    And I should see "location 1"

  Scenario: Delete worker
    Given the following workers:
      |age|gender|location|
      |age 1|gender 1|location 1|
      |age 2|gender 2|location 2|
      |age 3|gender 3|location 3|
      |age 4|gender 4|location 4|
    When I delete the 3rd worker
    Then I should see the following workers:
      |age|gender|location|
      |age 1|gender 1|location 1|
      |age 2|gender 2|location 2|
      |age 4|gender 4|location 4|
