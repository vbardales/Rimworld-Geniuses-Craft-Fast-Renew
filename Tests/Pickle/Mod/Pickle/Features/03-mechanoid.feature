# First run, 2026-09-28: the expectation of 1 was wrong, not the mod. A fresh constructoid with no Mechanitor
# work precept reads 0.5, because vanilla gives every mechanoid a WorkSpeedGlobal penalty
# (Biotech/Defs/HediffDefs/Hediffs_Mechanitor.xml's precepts only raise it back with WorkSpeedGlobalOffsetMech).
# That is the game's own arithmetic, unrelated to this mod: the stat card carried no Crafting line in the run
# that produced this value, which is what this scenario is actually meant to show. A pawn with no skill tracker
# takes StatDef.noSkillFactor, which is 1, instead of any skill need; noSkillFactor is not the same number as
# the finished stat, which is why the earlier expectation of a flat 1 was the wrong reading of that fact.
@requires:ludeon.rimworld.biotech
Feature: A mechanoid is not touched by the Crafting factor

  Scenario: a constructoid reads vanilla's own mech penalty, not a Crafting factor
    Given the save "test-colony" is loaded
    And I spawn a "Mech_Constructoid" pawn at (140, 155)
    Then the "Mech_Constructoid" at (140, 155) stat "GeneralLaborSpeed" is 0.5
    And no errors were logged
