# The pictures of the Workshop page, in the order to upload them (AUDIT.md step 9, GALLERY.md). A green run proves only that the route ran:
# every image is opened and judged against this plan. Shotlist rewritten 2026-10-25 after the owner refused every draft capture
# (idle pawns, sculptures lined up like a catalogue, stat card that never shows the stat). The scenarios below are the OLD drafts: they are
# rewritten, one per scene, once NPT answers the step requests of 2026-10-25 and the owner answers on Miel. No ticket before every scene is 4 or more.
#
# The mod adds one thing: a crafter's General Labor Speed grows with the Crafting skill, 0.30 + 0.50 x level (0.3 at level 0, 10.3 at level 20).
# That number is invisible on a map. The series makes it visible twice: as a pile that grows faster under the master's hands, and as the stat card.
#
# THE STORY: one afternoon in the preindustrial workshop of the sanctuary (`preindustrial-workshop`, centre (223, 237)). Nelim (the master, Crafting 20,
# Virginie, the protagonist) carves small sculptures at the sculpting table (221, 244). Miel Aveline (the apprentice, Crafting 3; NSB cast, needs the
# owner's authorization and a validated look) makes her first club at the crafting spot (226, 244) and hauls granite chunks to the stonecutter table
# (228, 238). Time: start 14:00, Clear; each scene reloads the save and waits cumulatively (2 500 ticks per hour): scene 1 at 14:00 (+60 ticks to settle),
# scene 2 at 14:05 (+268), scene 4 at 14:10 (+477), scene 5 at about 17:00 (+7 500, warm low light). The pile counts the afternoon: one sculpture at 14:00,
# four at 14:05, six at 17:00. Pawns hold a cell only while the game is paused: wait first, then place and give the job, then pause.
# Outfits keep through the day (continuity): Nelim in her fixture corset and trousers, hair Roo_HD_Hair_Highpony, brown eyes, her own face; Miel in ochre
# restoration clothes (look of MIEL-PROFIL.md once marked OK in LOOKS-VALIDATION.md). Daytime animals: Shogun (labrador) and Yuki (husky) of the fixture.
# Miel authorized by the owner 2026-10-25, only in scenes where Nelim is in frame (1, 4, 5 here; scene 2 is Nelim alone). Her look is still to be shown to the owner.
#
# Shot plan (one scenario = one image; tables with every criterion are in STATUS.md, "Shotlist"):
#   1. workshop-1-the-workshop, 14:00, wide, zoom 6.5, frame centred about (226, 240) so the vanometric cells of the west edge stay out. Nelim standing at the
#      sculpting table, chisel mid-stroke, ONE small sculpture finished beside her; Miel mid-stride carrying a granite chunk to the stonecutter table;
#      Shogun lying by the stonecutter; torches lit at the benches; plants: a daylily pot by the door. Says: two hands, one workshop, the master already ahead.
#      Instant: Nelim has just finished her first piece, Miel is about to set the chunk down. Obtained: forced job on the sculpting table for Nelim, forced haul
#      for Miel, game paused at that tick.
#   2. workshop-2-the-fourth-sculpture, 14:05, medium, zoom 5 on Nelim at the sculpting table: four sculptures on the floor, the fifth block in front of her,
#      Shogun lying, head turned toward the chisel; focused mouth (override of her smile, justified by concentration). Says: the pile grows. Instant: she has just
#      started the next one. Obtained: forced sculpting job, pause mid-work.
#   3. workshop-3-the-stat-card, interface window on `window-backdrop-for-height`, cropped laterally, no subtitle: Nelim's Stats card filtered on "labor",
#      General Labor Speed 10.3. Needs the search-box step asked of NPT (else scroll to the row). Not a staged photograph, not rated.
#   4. workshop-4-the-first-club, 14:10, close, zoom 3.2: Nelim in the soft foreground passing with a sculpture in her hands, Miel behind at the crafting spot with
#      her one club, Yuki facing Miel's hands. Says: three hundredths of the rate, the same afternoon. Instant: Miel has just finished the club, Nelim walks past.
#      Obtained: forced haul (carries) for Nelim, forced crafting job for Miel, pause.
#   5. workshop-5-the-count, about 17:00, medium, zoom 4 at the door: Nelim mid-stride carrying sculpture number six to the pile, Miel seated on the chair at
#      (224, 243) turned toward the pile, her club in hand; Shogun trotting toward the camera (the animal seen from the front). Says: the day, counted. Instant: the
#      pile just reached six, Miel watches. Closing image. Obtained: forced haul, Miel sits on the building, Shogun walks toward the camera, pause. Needs fed and rested pawns.
#
# NPT answered 2026-10-25: will build `the info card Stats tab is scrolled to the stat "<StatDef>"`, `the building "<def>" at (x, z) has the bill "<RecipeDef>"`, `N of the item "<def>" are spawned at (x, z)`, ETA 1-2 h, not played; cells hidden with `the things "VanometricPower" within 10 cells of (219, 237) are hidden`; crafting is a STANDING pose in vanilla; pose across the pause unverified (start job, let ticks pass, then pause).
#
# Previous drafts (gallery-draft1, draft2, draft5) are in docs/runs/history.md; their captures were refused 2026-10-25 and the evidence was folded.
#
# Two families of steps, told apart by their prefix: `Nelim's Sanctuary: ` (SB: the named places and the fixture Nelims-tribe) and
# `Nelim's Pickle Tools: ` (NPT: studio, camera, decor, colonists, animals). Steps without a prefix are Pickle's own.
@requires:nelim.pickletools.screenshotstudio
@workshop
@review
Feature: the pictures of the Workshop page

  # 0. What stands in the room: read before composing, not a picture.
  @recon
  Scenario: what the workshop holds
    Given the save "Nelims-tribe" is loaded
    And Nelim's Sanctuary: the buildings within 8 cells of (223, 237) are logged

  # 1. The mod's one idea in one picture: three levels of skill, three stacks, each crafter on a chair at a bench (stonecutter table east, sculpting table south).
  # Pawns stay put only while the game is paused, so time passes first, then everyone is placed and the game is paused.
  Scenario: three crafters, three stacks
    Given the save "Nelims-tribe" is loaded
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Sanctuary: I am at the sanctuary "preindustrial-workshop"
    And I set the hour to 12
    And I set the weather to "Clear"
    When Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Pickle Tools: a colonist "Mina" of kind "Colonist" exists
    And Nelim's Pickle Tools: a colonist "Joss" of kind "Colonist" exists
    And "Mina" skill "Crafting" is set to level 0
    And Nelim's Pickle Tools: "Mina" wears "Apparel_BasicShirt" dyed rgb (150, 160, 110)
    And Nelim's Pickle Tools: "Mina" hair colour is rgb (120, 70, 40)
    And Nelim's Pickle Tools: "Mina" face kit is "calm"
    And "Joss" skill "Crafting" is set to level 10
    And Nelim's Pickle Tools: "Joss" wears "Apparel_CollarShirt" dyed rgb (120, 85, 60)
    And Nelim's Pickle Tools: "Joss" hair colour is rgb (45, 38, 34)
    And Nelim's Pickle Tools: "Joss" face kit is "smile"
    And "Nelim" skill "Crafting" is set to level 20
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Mina" stands at (226, 243) facing North
    And Nelim's Pickle Tools: "Joss" stands at (227, 238) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (221, 243) facing North
    And Nelim's Pickle Tools: the other colonists are out of frame
    And I spawn a "MeleeWeapon_Club" at (226, 242)
    And I spawn a "BlocksGranite" at (226, 238)
    And I spawn a "BlocksGranite" at (226, 237)
    And I spawn a "SculptureSmall" at (220, 242)
    And I spawn a "SculptureSmall" at (221, 242)
    And I spawn a "SculptureSmall" at (222, 242)
    And I spawn a "SculptureSmall" at (222, 241)
    And Nelim's Pickle Tools: I place the decor "ORI_OrientalZither" at (223, 240)
    And Nelim's Pickle Tools: I place the decor "Oriental_Drum" at (226, 240)
    And Nelim's Pickle Tools: I frame the cell (224, 241) at zoom 2.0
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Yuki" is spawned at (225, 243)
    And game speed is paused
    And Nelim's Pickle Tools: the map is shown alone for a capture
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "workshop 1 - three crafters"
    When Nelim's Pickle Tools: the interface is shown again

  # 2. The master at her sculpting table, five minutes later.
  Scenario: Nelim at her bench, five minutes later
    Given the save "Nelims-tribe" is loaded
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Sanctuary: I am at the sanctuary "preindustrial-workshop"
    And I set the hour to 12
    And I set the weather to "Clear"
    When Nelim's Pickle Tools: I let 268 ticks pass
    And "Nelim" skill "Crafting" is set to level 20
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (221, 243) facing North
    And Nelim's Pickle Tools: the other colonists are out of frame
    And I spawn a "SculptureSmall" at (220, 242)
    And I spawn a "SculptureSmall" at (221, 242)
    And I spawn a "SculptureSmall" at (222, 242)
    And I spawn a "SculptureSmall" at (222, 241)
    And Nelim's Pickle Tools: I frame the cell (221, 243) at zoom 4.0
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poulette" is spawned at (223, 242)
    And game speed is paused
    And Nelim's Pickle Tools: the map is shown alone for a capture
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "workshop 2 - the master at her bench"
    When Nelim's Pickle Tools: the interface is shown again

  # 3. The apprentice at the next chair, ten minutes later: one item.
  Scenario: the apprentice at the next bench, ten minutes later
    Given the save "Nelims-tribe" is loaded
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Sanctuary: I am at the sanctuary "preindustrial-workshop"
    And I set the hour to 12
    And I set the weather to "Clear"
    When Nelim's Pickle Tools: I let 477 ticks pass
    And Nelim's Pickle Tools: a colonist "Mina" of kind "Colonist" exists
    And "Mina" skill "Crafting" is set to level 0
    And Nelim's Pickle Tools: "Mina" wears "Apparel_BasicShirt" dyed rgb (150, 160, 110)
    And Nelim's Pickle Tools: "Mina" hair colour is rgb (120, 70, 40)
    And Nelim's Pickle Tools: "Mina" face kit is "calm"
    And Nelim's Pickle Tools: "Mina" stands at (226, 243) facing North
    And Nelim's Pickle Tools: the other colonists are out of frame
    And I spawn a "MeleeWeapon_Club" at (226, 242)
    And Nelim's Pickle Tools: I frame the cell (226, 243) at zoom 4.0
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Yuki" is spawned at (225, 242)
    And game speed is paused
    And Nelim's Pickle Tools: the map is shown alone for a capture
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "workshop 3 - the apprentice"
    When Nelim's Pickle Tools: the interface is shown again

  # 4. The stat card of the master: a screen capture, not staged.
  @requires:nelim.pickletools.inspecttabs
  Scenario: the stat card at Crafting 20
    Given the save "Nelims-tribe" is loaded
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And I set the hour to 12
    And Nelim's Pickle Tools: all animals are removed
    And "Nelim" skill "Crafting" is set to level 20
    And game speed is paused
    When I select "Nelim"
    And Nelim's Pickle Tools: I open the info card of the selected thing on the "Stats" tab
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "workshop 4 - the stat card at Crafting 20"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And Nelim's Pickle Tools: I close the info card

  # 5. The same card at Crafting 0.
  @requires:nelim.pickletools.inspecttabs
  Scenario: the stat card at Crafting 0
    Given the save "Nelims-tribe" is loaded
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And I set the hour to 12
    And Nelim's Pickle Tools: all animals are removed
    And "Nelim" skill "Crafting" is set to level 0
    And game speed is paused
    When I select "Nelim"
    And Nelim's Pickle Tools: I open the info card of the selected thing on the "Stats" tab
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "workshop 5 - the stat card at Crafting 0"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And Nelim's Pickle Tools: I close the info card
