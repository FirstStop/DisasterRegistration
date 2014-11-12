@javascript
Feature: Wizard based registrations

  Scenario: As a survivor, I want to use have a guided self registration
    Given I am on the registration page
    Then I should see an explanation about FirstStop

    When I select to start my registration
    Then I should be asked for my basic information

    When I decide to submit my application
    Then my data should be captured in the database
    And I should see a personalised QR code