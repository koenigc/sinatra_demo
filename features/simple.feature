Feature: Test
  In order to test Cucumber
  As a user 
  I want to be welcomed by the system

  Scenario: enter my name
    Given I visit the formular page
    
    # Then I should see 'Wie ist dein Name'
    Then I should see 'form.label.name'
    
    When I fill in 'Karl Napf' for 'name'
    And I press 'submit'
    
    # Then I should see 'Willkommen Karl Napf!'
    Then I should see 'form.response'
