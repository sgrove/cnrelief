Feature: Manage jobs
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Create a new client
    Given a company named "PuroPrinters"
    Given that I am logged in as estimater "joe@puroprinters.com"
    When I go to the jobs page

    And I follow "New Quote"
    And I check "New company"

    And I follow "Create new company for PuroPrinter"
    Then I should see "I'm sorry, creating a new client requires at least a company name and one contact method"
    And I should see "If you want to create a temporary estimate, please use the Temporary Estimate Tool."

    When I fill in "company_name" with "MiloStudy"
    And I fill in "company_address_1" with "2219 Piedmont Ave."
    And I fill in "company_city" with "Berkeley"
    And I select "California" from "company_state"
    And I fill in "company_zip" with "94720"

    And I fill in "company_contact_name" with "Milo Ceville"
    And I fill in "company_contact_phone" with "949-555-1210"
    And I fill in "company_contact_cell" with "949-555-1211"
    And I fill in "company_contact_fax" with "949-555-1212"
    And I fill in "company_contact_email" with "mceville@milostudy.com"

    And I follow "Create new company for PuroPrinter"
    Then I should see "Great! We've added MiloStudy as a client for PuroPrinters and assigned you as the primary contact."
  
  Scenario: Register new estimate for a new company
    Given a company named "PuroPrinters"
    Given that I am logged in as estimater "joe@puroprinters.com"
    When I go to the jobs page

    And I follow "New Quote"
    And I check "New company"
    And I create a valid client "MiloStudy"

    Then I should see "New Quote Details"
    And I should see "Current Estimator is Joe User"
    And I should see "Current CSR is Joe User"
    And I should see "

    When I fill in "po_number" with "5555"
    And I select "1 day rush" from "turnaround"
    

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

