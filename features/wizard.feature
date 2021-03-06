@javascript
Feature: Wizard based registrations

  Scenario: As a survivor, I want to use have a guided self registration
    Given a basic registration wizard is defined
    And I am on the registration page
    Then I should see an explanation about FirstStop

    When I select to start my registration
    Then I should be asked for my basic information
    | Attribute | Answer      |
    | input2-1  | Input 2 - 1 |
    | input2-2  | Input 2 - 2 |
    | input3-1  | Input 3 - 1 |
    | input3-2  | Input 3 - 2 |
    When I decide to submit my application
    Then I should see a personalised QR code
    And my data should be captured in the database
      | Attribute | Value       |
      | input2-1  | Input 2 - 1 |
      | input2-2  | Input 2 - 2 |
      | input3-1  | Input 3 - 1 |
      | input3-2  | Input 3 - 2 |

