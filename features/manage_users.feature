Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new campaigner
    Given I am on the new user page
    When I fill in "Email" with "iluvabs@abtacular.com"
    And I fill in "Password" with "super_s3cr3t"
    And I fill in "Password Confirmation" with "super_s3cr3t"
    And I check "I read these terms of service, and I agree to all of them!"
    And I press "Let me in!"
    Then I should see "Welcome to ABTacular! Why not fill in your profile to get started?"
    And I should see "My full name is"
    When I follow "Nah, I'll do it later"
    Then I should see "Let's create a new campaign"

  Scenario: Delete user
    Given the following users:
      |email|password|password_confirmation|
      |iluvabs@abtacular.com|testtest|testtest|
      |abrocks@abtacular.com|testtest|testtest|
      |itroll@abtacular.com|testtest|testtest|
      |clickclickgood@abtacular.com|testtest|testtest|
    When I delete the 3rd user
    Then I should see the following users:
      |email|
      |iluvabs@abtacular.com|
      |abrocks@abtacular.com|
      |clickclickgood@abtacular.com|

  Scenario: Fill in profile data
    Given that I am logged in as "ccg@abtacular.com"
    When I go to the dashboard page
    And I follow "My profile"
    Then I should see "My full name is"
    When I fill in "user_full_name" with "Sir ClickClickGood"
    And I fill in "user_zip" with "94720"
    And I fill in "user_city" with "Berkeley"
    And I fill in "user_address1" with "2219 Piedmont Ave."
    And I press "update"
    Then I should see "Updated your profile"

