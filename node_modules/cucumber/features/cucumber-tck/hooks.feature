Feature: Environment Hooks

  Cucumber provides a number of hooks which allow you to
  configure the environment for your application. By
  default hooks are run for each scenario, but you can use
  tagged hooks if you want more fine grained control.

  Scenario: Before and After
    Given a passing before hook
    And a passing after hook
    When Cucumber executes a scenario
    Then the before hook is fired before the scenario
    And the after hook is fired after the scenario

  Scenario: Around
    Given a passing around hook
    When Cucumber executes a scenario
    Then the around hook fires around the scenario

  Scenario: Around fires around other hooks
    Given a passing around hook
    And a passing before hook
    And a passing after hook
    When Cucumber executes a scenario
    Then the around hook is fired around the other hooks

  Scenario: Tagged hook with matching scenario tag
    Given a hook tagged with "@foo"
    When Cucumber executes a scenario tagged with "@foo"
    Then the hook is fired

  Scenario: Tagged hook without matching scenario tag
    Given a hook tagged with "@foo"
    When Cucumber executes a scenario tagged with "@bar"
    Then the hook is not fired

  Scenario: Tagged hook with untagged scenario
    Given a hook tagged with "@foo"
    When Cucumber executes a scenario with no tags
    Then the hook is not fired

  Scenario: Untagged hook with tagged scenario
    Given an untagged hook
    When Cucumber executes a scenario tagged with "@bar"
    Then the hook is fired
