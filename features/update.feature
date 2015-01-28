@javascript @wip
Feature: Wizard based registrations

  Scenario: As a survivor, I want to use have a guided self registration
    Given there is one support agency "Test123" with a basic update wizard
    And there is one registered survivor:
    |  |

    When I open the update wizard for service provider "Test123" and survivor "John"
    Then I should see the basic update wizard
    And I should be asked for my basic information
      | Attribute | Answer      |
      | input2-1  | Input 2 - 1 |
      | input2-2  | Input 2 - 2 |
      | input3-1  | Input 3 - 1 |
      | input3-2  | Input 3 - 2 |

    When I decide to submit my application
    Then my data should be captured in the database
      | Attribute | Value       |
      | input2-1  | Input 2 - 1 |
      | input2-2  | Input 2 - 2 |
      | input3-1  | Input 3 - 1 |
      | input3-2  | Input 3 - 2 |


