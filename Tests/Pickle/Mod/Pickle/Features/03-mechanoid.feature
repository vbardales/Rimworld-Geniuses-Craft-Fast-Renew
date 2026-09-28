# A pawn with no skill tracker takes StatDef.noSkillFactor, which is 1, instead of any skill need. A work mech must
# therefore read the same as it did without this mod. The expected value 1 is an assumption about a mech's other
# factors (Manipulation and Sight at full, WorkSpeedGlobal neutral); if it fails, read the actual value in the
# failure message before blaming the mod, and correct the expectation if the mech's own stat is what differs.
@requires:ludeon.rimworld.biotech
Feature: A mechanoid is not touched by the Crafting factor

  Scenario: a constructoid reads a flat General labor speed
    Given the save "test-colony" is loaded
    And I spawn a "Mech_Constructoid" pawn at (140, 155)
    Then the "Mech_Constructoid" at (140, 155) stat "GeneralLaborSpeed" is 1
    And no errors were logged
