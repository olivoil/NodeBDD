Feature: Failing steps
  In order to do Behaviour-Driven Development
  As a developer
  I want to see the details about failing steps

  Scenario: see exception message
    Given a scenario with:
      """
      When I divide 10 by 0
      Then the result is 9
      """
    And the step "I divide 10 by 0" has a mapping failing with the message "Divide by 0, uh?"
    And the step "the result is 9" has a passing mapping
    When Cucumber executes the scenario
    Then the failure message "Divide by 0, uh?" is output

  Scenario: see failing scenarios
    Given the following feature:
      """
      Feature: a feature
        Scenario: a passing scenario
          When I add 4 and 5
          Then the result is 9

        Scenario: a failing scenario
          When I divide 10 by 0
          Then the result is 9

        Scenario: another failing scenario
          When I divide 10 by 0
          Then the result is 9
      """
    And the step "I add 4 and 5" has a passing mapping
    And the step "I divide 10 by 0" has a mapping failing with the message "Divide by 0, uh?"
    And the step "the result is 9" has a passing mapping
    When Cucumber runs the feature
    Then the scenario called "a failing scenario" is reported as failing
    And the scenario called "another failing scenario" is reported as failing
    But the scenario called "a passing scenario" is not reported as failing
