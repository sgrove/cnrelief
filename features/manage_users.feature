Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given a company named "PuroPrinters"
    Given I am on the new user page
    When I fill in "Email" with "user@puroprinters.com"
    And I fill in "Password" with "super_s3cr3t"
    And I fill in "Password Confirmation" with "super_s3cr3t"
    And I check "I read these terms of service, and I agree to all of them!"
    And I press "I'm ready to join!"
    Then I should see "Welcome to PrintWorks! Why not fill in your profile to get started?"
    And I should see "My full name is"
    And I should see "I primarily spend my time as an"
    When I follow "Nah, I'll do it later"
    Then I should see "Here's the latest news for PuroPrinters"

  Scenario: Delete user
    Given the following users:
      |email|password|password_confirmation|
      |iluvprinting@puroprinters.com|testtest|testtest|
      |printrocks@puroprinters.com|testtest|testtest|
      |itroll@puroprinters.com|testtest|testtest|
      |clickclickgood@puroprinters.com|testtest|testtest|
    When I delete the 3rd user
    Then I should see the following users:
      |email|
      |iluvprinting@puroprinters.com|
      |printrocks@puroprinters.com|
      |clickclickgood@puroprinters.com|

  Scenario: Fill in profile data
    Given that I am logged in as "joe@puroprinters.com"
    When I go to the dashboard page
    And I follow "My profile"
    Then I should see "My full name is"
    When I fill in "user_full_name" with "Joe User"
    And I fill in "user_zip" with "94720"
    And I fill in "user_city" with "Berkeley"
    And I fill in "user_address1" with "2219 Piedmont Ave."
    And I press "update"
    Then I should see "Updated your profile."
    And I should see "Thanks for that, Joe."

