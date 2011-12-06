Feature: World (or Context)

  Scenario: access World variable
    Given a World variable initialized to 1
    When Cucumber executes a scenario that increments the World variable by 1
    Then the feature passes
    And the World variable should have contained 2 at the end of the scenario

  Scenario: different World instances between scenarios
    Given a World variable initialized to 1
    When Cucumber executes two scenarios that increment the World variable by 1
    Then the feature passes
    And the World variable should have contained 2 at the end of the first scenario
    And the World variable should have contained 2 at the end of the second scenario

  Scenario: call function from World
    Given a World function
    When Cucumber executes a scenario that calls the World function
    Then the feature passes
    And the World function should have been called

  Scenario: replace World constructor
    Given a custom World constructor
    And a World function
    When Cucumber executes a scenario that calls the World function
    Then the feature passes
    And the World function should have been called
