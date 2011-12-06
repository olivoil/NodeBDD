Feature: Comments

  Comments can be inserted pretty much anywhere within feature files. Those comments start with a hash sign (#) and are not interpreted by Cucumber.

  Scenario: Comments in a feature file
    Given the following feature:
      """
      # Hi.
      Feature: some feature
        Comments can be (almost) everywhere.
        # And another comment

        Scenario: some scenario
          # Yet another one.
          When a step runs
          Then a step runs
          # Oh my, comments are everywhere.
      # Thank you for reading.
      """
    When Cucumber runs the feature
    Then the feature passes
