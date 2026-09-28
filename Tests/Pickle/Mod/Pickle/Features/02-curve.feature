# The colonist is generated, and a generated colonist is random: traits and backstories move WorkSpeedGlobal.
# The precondition step therefore reads WorkSpeedGlobal first, so that a fixture that is not neutral fails there,
# by name, and not as a wrong curve. The expected values are 0.30 + 0.50 x level, unclamped by the mod, on a pawn
# whose other factors are all 1. Level 0 is the one that matters most: it is above the stat's minValue of 0.1, so
# it must read 0.3 and not 0.1.
Feature: The curve is Buitrago's

  Background:
    Given the save "test-colony" is loaded
    And a colonist "Operator" exists
    And "Operator" has childhood "ShopKid36"
    And "Operator" has backstory "Blacksmith7"
    And "Operator" has no hediffs
    Then "Operator" stat "WorkSpeedGlobal" is 1

  Scenario Outline: crafting level <level> reads <factor>
    When "Operator" skill "Crafting" is set to level <level>
    Then "Operator" stat "GeneralLaborSpeed" is <factor>
    And no errors were logged

    Examples:
      | level | factor |
      | 0     | 0.3    |
      | 1     | 0.8    |
      | 2     | 1.3    |
      | 5     | 2.8    |
      | 10    | 5.3    |
      | 15    | 7.8    |
      | 20    | 10.3   |
