# Pass avec-statsmatter. Stats Matter creates or replaces the list with 0.9 + 0.025 x level and is staged before
# this mod, so this mod appends to the list Stats Matter made: two entries, and at crafting 10 they multiply:
# 1.15 x 5.30 = 6.095. Were the order reversed, Stats Matter's replacement would remove this mod's entry, which
# is the reason About.xml declares it in loadAfter.
@requires:StatsMatter.velcroboy333
Feature: With Stats Matter, this mod appends to Stats Matter's list

  Scenario: two skill needs, and their product at crafting 10
    Given mod "StatsMatter.velcroboy333" is loaded
    And mod "StatsMatter.velcroboy333" loads before "nelim.geniusescraftfast"
    And the save "test-colony" is loaded
    Then def "GeneralLaborSpeed" field "skillNeedFactors.Count" is "2"
    When a colonist "Operator" exists
    And "Operator" has childhood "ShopKid36"
    And "Operator" has backstory "Blacksmith7"
    And "Operator" has no hediffs
    And "Operator" skill "Crafting" is set to level 10
    Then "Operator" stat "WorkSpeedGlobal" is 1
    And "Operator" stat "GeneralLaborSpeed" is 6.095
    And no errors were logged
