Feature: Undefined steps
  In order to do Behaviour-Driven Development
  As a developer
  I want to see the details about undefined steps

  Scenario: step definition snippet suggestion
    Given a scenario with:
      """
      Given I am a veggie
      When I eat meat
      Then I get sick
      """
    And the step "I am a veggie" has no mapping
    And the step "I eat meat" has no mapping
    And the step "I get sick" has no mapping
    When Cucumber executes the scenario
    Then a "Given" step definition snippet for /^I am a veggie$/ is suggested
    And a "When" step definition snippet for /^I eat meat$/ is suggested
    And a "Then" step definition snippet for /^I get sick$/ is suggested

  Scenario: repeating steps (And, But)
    Given a scenario with:
      """
      Given I am a veggie
      And I love food
      When I eat gherkins
      And I eat cucumbers
      Then I feel satiated
      And I feel energized
      But I have nothing left to eat
      """
    And the steps have no mappings
    When Cucumber executes the scenario
    Then a "Given" step definition snippet for /^I am a veggie$/ is suggested
    And a "Given" step definition snippet for /^I love food$/ is suggested
    And a "When" step definition snippet for /^I eat gherkins$/ is suggested
    And a "When" step definition snippet for /^I eat cucumbers$/ is suggested
    And a "Then" step definition snippet for /^I feel satiated$/ is suggested
    And a "Then" step definition snippet for /^I feel energized$/ is suggested
    And a "Then" step definition snippet for /^I have nothing left to eat$/ is suggested

  Scenario: star steps (*)
    Given a scenario with:
      """
      Given I am a veggie
      * I love food
      When I eat gherkins
      * I eat cucumbers
      Then I feel satiated
      * I feel energized
      * I have nothing left to eat
      """
    And the steps have no mappings
    When Cucumber executes the scenario
    Then a "Given" step definition snippet for /^I am a veggie$/ is suggested
    And a "Given" step definition snippet for /^I love food$/ is suggested
    And a "When" step definition snippet for /^I eat gherkins$/ is suggested
    And a "Given" step definition snippet for /^I eat cucumbers$/ is suggested
    And a "Then" step definition snippet for /^I feel satiated$/ is suggested
    And a "Given" step definition snippet for /^I feel energized$/ is suggested
    And a "Given" step definition snippet for /^I have nothing left to eat$/ is suggested

  Scenario: escape regexp special characters
    Given a scenario with:
      """
      Given I am a happy veggie \o/
      When I type -[]{}()*+?.,\^$|#/
      """
    When Cucumber executes the scenario
    Then a "Given" step definition snippet for /^I am a happy veggie \\o\/$/ is suggested
    Then a "When" step definition snippet for /^I type \-\[\]\{\}\(\)\*\+\?\.\,\\\^\$\|\#\/$/ is suggested

  Scenario: step matching groups
    Given a scenario with:
      """
      Given I have 5 "kekiri" cucumbers
      """
    When Cucumber executes the scenario
    Then a "Given" step definition snippet for /^I have (\d+) "([^"]*)" cucumbers$/ with 2 parameters is suggested

  Scenario: step with doc strings
    Given a scenario with:
      """
      Given the following Wikipedia excerpt:
        \"\"\"
        The cucumber (Cucumis sativus) is a widely cultivated plant
        in the gourd family Cucurbitaceae, which includes squash,
        and in the same genus as the muskmelon.
        \"\"\"
      """
      When Cucumber executes the scenario
      Then a "Given" step definition snippet for /^the following Wikipedia excerpt:$/ with a doc string is suggested

  Scenario: step with data tables:
    Given a scenario with:
      """
      Given the following cucumbers:
        | variety       | score |
        | persian       |     3 |
        | c-thru-cumber |     1 |
        | lebanese      |     4 |
        | kekiri        |     5 |
      """
      When Cucumber executes the scenario
      Then a "Given" step definition snippet for /^the following cucumbers:$/ with a data table is suggested
