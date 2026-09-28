# Pass avec-decore. DeCore adds its own Crafting entry unconditionally (1 + 0.03 x level) and is staged before
# this mod, so the list holds two entries and at crafting 10 they multiply: 1.30 x 5.30 = 6.89. That is not a
# duplicate application of this mod: two different entries. See wsl-deps.avec-decore.map for the prerequisite.
@requires:Daniledman.DeCore
Feature: With DeCore, this mod appends to DeCore's list

  Scenario: two skill needs, and their product at crafting 10
    Given mod "Daniledman.DeCore" is loaded
    And mod "Daniledman.DeCore" loads before "nelim.geniusescraftfast"
    And the save "test-colony" is loaded
    Then def "GeneralLaborSpeed" field "skillNeedFactors.Count" is "2"
    When a colonist "Operator" exists
    And "Operator" has childhood "ShopKid36"
    And "Operator" has backstory "Blacksmith7"
    And "Operator" has no hediffs
    And "Operator" skill "Crafting" is set to level 10
    Then "Operator" stat "WorkSpeedGlobal" is 1
    And "Operator" stat "GeneralLaborSpeed" is 6.89
    And no errors were logged
