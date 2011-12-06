Feature: Core: Scenarios, Steps, Mappings

  Cucumber is a tool for executing business-readable specifications
  written in Gherkin. The basic unit of both specification and
  execution is the Scenario. A Scenario is a list of steps, each of
  which representing an action performed by a user (or user agent)
  on the software product under development. When a Scenario is
  executed, its steps are applied to the software system in the order
  they are contained in the Scenario.

  Gherkin is not a programming language, so in order to execute steps
  written in it, Cucumber must first look up a mapping from the text of
  each step to a function. If such a mapping exists, the function is
  executed, and the result is communicated to the user.

  Scenario: All steps passing means the scenario passes
    Given a scenario with:
      """
      When I add 4 and 5
      Then the result is 9
      """
    And the step "I add 4 and 5" has a passing mapping
    And the step "the result is 9" has a passing mapping
    When Cucumber executes the scenario
    Then the scenario passes

  Scenario: Failing step means the scenario fails
    Given a scenario with:
      """
      When I add 4 and 5
      Then the result is 9
      """
    And the step "I add 4 and 5" has a failing mapping
    And the step "the result is 9" has a passing mapping
    When Cucumber executes the scenario
    Then the scenario fails
    And the step "the result is 9" is skipped

  Scenario: Pending step means the scenario is pending
    Given a scenario with:
      """
      When I add 4 and 5
      Then the result is 9
      """
    And the step "I add 4 and 5" has a pending mapping
    And the step "the result is 9" has a passing mapping
    When Cucumber executes the scenario
    Then the scenario is pending
    And the step "the result is 9" is skipped

  Scenario: Missing step mapping means the scenario is undefined
    Given a scenario with:
      """
      When I add 4 and 5
      Then the result is 9
      """
    And the step "the result is 9" has a passing mapping
    When Cucumber executes the scenario
    Then the scenario is undefined
    And the step "the result is 9" is skipped

  Scenario: Feature headers
    Given the following feature:
      """
      Feature: a feature
        In order to get results
        As a user
        I want to do something
      """
    When Cucumber runs the feature
    Then the feature passes

  Scenario: Simple flat steps
    Given a scenario with:
      """
      Given a calculator
      When the calculator computes PI
      Then the calculator returns PI
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario passes

  Scenario: Given, When, Then, And and But steps
    Given a scenario with:
      """
      Given a calculator
      When the calculator adds up 1 and 2
      And the calculator adds up 3 and 0.14159265
      Then the calculator returns PI
      But the calculator does not return 3
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario passes

  Scenario: Failing steps
    Given a scenario with:
      """
      Given a calculator
      When the calculator adds up 3 and 0.14
      Then the calculator returns PI
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario fails

  Scenario: Single-parameter step
    Given a scenario with:
      """
      Given a calculator
      When the calculator computes PI
      Then the calculator returns "3.14159265"
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario passes

  Scenario: Two-parameter step
    Given a scenario with:
      """
      Given a calculator
      When the calculator adds up "12" and "51"
      Then the calculator returns "63"
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario passes

  Scenario: Two-parameter step failing
    Given a scenario with:
      """
      Given a calculator
      When the calculator adds up "12" and "51"
      Then the calculator returns "65"
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario fails

  Scenario: Three-parameter step
    Given a scenario with:
      """
      Given a calculator
      When the calculator adds up "3", "4" and "5"
      Then the calculator returns "12"
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario passes
