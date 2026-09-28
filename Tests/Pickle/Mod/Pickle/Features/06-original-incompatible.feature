# Pass incompat-original. About.xml declares the original mod incompatible. This asserts the symptom instead of
# waiting for a red: the original adds the same Crafting entry unconditionally, this mod finds the list and adds
# a second one, and at crafting 10 the two multiply to 5.30 x 5.30 = 28.09 instead of 5.30. Green means the
# incompatibility still behaves as declared; red means the original changed, or the staging dropped it.
@requires:Buitrago.GeniusesCraftFast
Feature: With the original mod, the Crafting factor is applied twice

  Scenario: two identical skill needs, and their product at crafting 10
    Given mod "Buitrago.GeniusesCraftFast" is loaded
    And the save "test-colony" is loaded
    Then def "GeneralLaborSpeed" field "skillNeedFactors.Count" is "2"
    When a colonist "Operator" exists
    And "Operator" has childhood "ShopKid36"
    And "Operator" has backstory "Blacksmith7"
    And "Operator" has no hediffs
    And "Operator" skill "Crafting" is set to level 10
    Then "Operator" stat "WorkSpeedGlobal" is 1
    And "Operator" stat "GeneralLaborSpeed" is 28.09
    And no errors were logged
