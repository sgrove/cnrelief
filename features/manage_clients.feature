Feature: Manage clients
  In order to keep track of clients
  Company
  want to manage clients

  Scenario: Create a new client via the estimates page
    Given a company named "PuroPrinters"
      And I am logged in as "joe@puroprinters.com"
      And I am a member of the estimator group
      And I belong to the employee group "csr"

    When I submit a valid company named "MiloStudy"
      And I follow "Create new company for PuroPrinter"

    Then I should see "Great! We've added MiloStudy as your client."


  Scenario: Create a new client via the client management page
    Given a company named "PuroPrinters"
      And I am logged in as estimator "joe@puroprinters.com"
      And I belong to the employee group "csr"

    When I go to the clients page
      And I follow "Create new company for PuroPrinters"

    Then I should see "Let's add a new client for your company..."

    When I submit a valid company named "MiloStudy"
    
    Then I should see "Great! We've added MiloStudy as your client."

  Scenario: Creating a new client requires permission
    Given a company named "PuroPrinters"
      And I am logged in as estimator "joe@puroprinters.com"

    When I go to the clients page

    Then I should not see "Create a new company for PuroPrinters"

    When I go to the new client page

    Then I should see "I'm sorry, you don't seem to have permission to do that."

  Scenario: Clients must have at least one contact
    When I go to the jobs page
      And I follow "New Quote"
      And I check "New company"
      And I follow "Create new company for PuroPrinters"

    Then I should see "I'm sorry, creating a new client requires at least a company name And one contact method"
      And I should see "If you want to create a temporary estimate, please use the Temporary Estimate Tool."
