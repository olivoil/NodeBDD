Feature: Doc Strings

  Multiline strings are handy for specifying a larger piece of
  text. This is done using the DocString syntax. The text should be
  offset by delimiters consisting of three double-quote marks on lines
  of their own.

  Scenario: Step accepting a DocString parameter
    Given a scenario with:
      """
      Given a calculator
      When the calculator adds up the following numbers:
        \"\"\"
        3
        6
        1
        12
        \"\"\"
      Then the calculator returns "22"
      """
    When Cucumber runs the scenario with steps for a calculator
    Then the scenario passes

  # TODO: Ensure DocStrings are passed to step definitions.
