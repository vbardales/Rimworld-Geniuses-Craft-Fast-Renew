# The patch is one operation with no def of its own, so the log cannot say it landed: a patch that applies writes
# nothing, and one that applies twice writes nothing either. What the game can show is the def after the loader
# has run. In this pass (Core, the DLCs, Pickle) no other mod touches the stat, and vanilla's GeneralLaborSpeed
# carries no skillNeedFactors, so the list must hold exactly the one entry this mod creates.
#
# First run, 2026-09-28: "was patched by mod ..." matches the mod's display name, not its packageId, contrary to
# what PickleTools/docs/steps.md's own entry for that step implies. Confirmed with the failure message, which named
# the mod that did patch it. Use the display name here too.
Feature: The Crafting factor lands on General labor speed, once

  Scenario: the loader kept one skill need, written by this mod
    Given mod "nelim.geniusescraftfast" is loaded
    Then def "GeneralLaborSpeed" was patched by mod "Geniuses Craft Fast Renew (unofficial)"
    And def "GeneralLaborSpeed" field "skillNeedFactors.Count" is "1"
