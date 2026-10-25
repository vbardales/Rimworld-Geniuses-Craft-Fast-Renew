# The pictures of the Workshop page, in the order to upload them (AUDIT.md step 9, GALLERY.md). A green run proves only that the route ran:
# every image is opened and judged against this plan. Shotlist rewritten 2026-10-25 after the owner refused every draft capture (idle pawns,
# sculptures lined up like a catalogue, a stat card that never shows the stat); revised the same day after rate-gallery gave 2.0. The scenarios
# below are the OLD drafts: they are rewritten, one per scene, once NPT's steps compile (stat-card scroll, bill on a bench, spawn N of an item).
# No ticket before every staged scene is 4 or more by the rule of rate-gallery.
#
# The mod adds one thing: a crafter's General Labor Speed grows with the Crafting skill, 0.30 + 0.50 x level (0.3 at level 0, 10.3 at level 20).
# That number is invisible on a map. The series shows it twice: a pile of sculptures that grows faster under the master's hands, and the stat card.
#
# THE STORY: one afternoon in the preindustrial workshop of the sanctuary (`preindustrial-workshop`, centre (223, 237); benches: sculpting table (221, 244),
# crafting spot (226, 244), stonecutter table (228, 238); chair (224, 243)). Nelim (Virginie, the protagonist, the master, Crafting set to 20 for the series)
# carves small sculptures. Miel Aveline (the apprentice, Crafting set to 3) makes her first club and hauls granite chunks. Miel is authorized by the owner
# (2026-10-25) only in scenes where Nelim is in frame: all staged scenes comply. Time: each scene reloads the save, sets the hour and waits (2 500 ticks per
# hour): scene 1 `I set the hour to 14` then 60 ticks to settle; scene 2 +268 ticks (14:05); scene 4 +477 (14:10); scene 5 `I set the hour to 17`
# (no wait: nothing drifts). Clear sky, indoors under the roof. The pile counts the afternoon: 1 sculpture in scene 1, 4 in scene 2, 6 in scene 5.
# Gestures: place the pawn, start the forced job, `I let N ticks pass`, then `game speed is paused`, presentation mode, capture (NPT 2026-10-25: the
# animation draws only while the game ticks). Every N below is a first guess, read on the first capture. Everything staged is removed by the save reload.
#
# Cast, kept for the whole afternoon (continuity). Nelim: `Roo_HD_Hair_Highpony` (canon high ponytail, no hat), dark brown eyes (fixture), brows BrowNormal,
#   `Apparel_BasicShirt` dyed rgb (30, 110, 80) deep emerald, `Apparel_Pants` dyed rgb (110, 85, 60) brown. Mouth: concentrating `MouthNormal` in scenes 1 and 2
#   (override of her smirk, justified by the work), her own `MouthSmirkSmile` in scenes 4 and 5 (a small smile).
#   Miel: hair `Roo_Royal_NaturalcurlsHD` black, skin rgb (112, 67, 26), eyes gene `Eyes_Golden`, brows BrowTriangle, mouth `MouthClassicSmile` (not the lips family,
#   not Nelim's smile), no face tattoo, `Apparel_CollarShirt` dyed ochre rgb (190, 140, 60), `Apparel_Pants` dyed sage rgb (120, 140, 100). Her look is not
#   marked OK in LOOKS-VALIDATION.md: the first capture is shown to the owner. Animals of the fixture: Shogun (labrador), Yuki (husky), undressed (no garment logical here).
# Mods: map = wsl-deps.sanctuary-base.map (no Atelier, no Oriental Instruments: they are not in the story and slowed the load) plus `rooboid.hdhair.continued`
#   3559870636 for the two hairstyles. Steps: Sanctuary steps and the NPT steps listed in STATUS.md; missing ones asked of NPT (answers in STATUS.md).
#
# Shot plan (one scenario = one image; the table with every criterion and the estimates is in STATUS.md, "Shotlist"):
#   1. workshop-1-the-workshop, 14:00, wide. Zoom 5.5 on frame (225, 241): background the east wall and the stonecutter table, foreground the floor with one
#      granite chunk; Nelim off-centre left at the sculpting table, Miel right of centre hauling; light: torches lit at the three benches. Decor: `TorchLamp` x3
#      lit, `PlantPot_Bonsai` by the door, one `SculptureSmall` beside Nelim, `ChunkGranite` at (219, 238). Pawns: Nelim mid-stroke (forced job on the sculpting
#      table, bill for a small sculpture), Miel mid-stride carrying a granite chunk from (219, 238) to the stonecutter table (228, 238) (forced haul of 1
#      `ChunkGranite`), paused 90 ticks after the start, her path half covered. Shogun lying near the stonecutter, head toward the pawns. Says: two hands, one
#      workshop, the master already ahead. Instant: Nelim has just finished her first piece, Miel is about to set the chunk down. Thumbnail: the two figures and
#      the lit benches read at 268 px; the mod itself shows from scene 2 on, this is the opening image. Cells hidden with
#      `the things "VanometricPower" within 10 cells of (219, 237) are hidden`.
#   2. workshop-2-the-fourth-sculpture, 14:05, medium. Zoom 5 on (221, 243): Nelim sharp in the middle third, foreground the four finished `SculptureSmall` in a loose
#      cluster (not a line) on the tiles at (219..220, 241..242), background the sculpting table and a torch, light warm from the torch at (220, 245). Nelim
#      mid-work (forced sculpting job, paused 120 ticks after the start, chisel arm raised), the next stone block on the table. Shogun lying near her feet, head
#      turned to the chisel. Says: the pile grows. Instant: she has just set the fourth piece down and started the fifth. Thumbnail: the cluster of four brown
#      pieces spans about a quarter of the width (1 cell = 15 px at 268 px) against beige tiles.
#   3. workshop-3-the-stat-card, interface window on `window-backdrop-for-height`, cropped laterally, no subtitle: Nelim at Crafting 20, Stats tab scrolled to
#      General Labor Speed 10.3 (NPT step `the info card Stats tab is scrolled to the stat "<StatDef>"`). Not a staged photograph, not rated.
#   4. workshop-4-the-first-club, 14:10, close. Zoom 3.2 on (225, 244): soft foreground, Nelim at the left edge walking past carrying one `SculptureSmall` (carries 1
#      item, MouthSmirkSmile, paused 60 ticks into the walk); subject Miel at the crafting spot, centred, one finished `MeleeWeapon_Club` on the bench, her crafting
#      job paused 120 ticks in; Yuki sitting at Miel's side, face turned to her hands; background the wall with a torch. Says: three hundredths of the rate, the
#      same afternoon. Instant: Miel has just finished her first club, Nelim walks by with the next sculpture. Thumbnail: Miel and the club are the largest shapes,
#      about 23 px tall at 268 px.
#   5. workshop-5-the-count, 17:00, medium, closing image. Zoom 4 at the doorway (224, 241) looking in: Nelim mid-stride carrying sculpture number six to the pile
#      (forced haul, paused 80 ticks in, MouthSmirkSmile), Miel seated on the chair at (224, 243) turned to the pile, her club in her lap (sits on the building, job
#      paused), six `SculptureSmall` in a loose cluster in the middle ground, Shogun trotting toward the camera (walk to the door, paused 60 ticks in; the animal
#      seen from the front), warm low light from the torches and the hour 17, background the sculpting table. Says: the day, counted. Instant: the pile just reached
#      six and Miel watches it. Thumbnail: the cluster of six pieces and the two figures, Shogun largest in the foreground.
#
# Steps asked of NPT, 2026-10-25, all answered YES or already existing, none played: stat-card scroll, bill on a bench, spawn N of an item, hide by def. If a step
# later fails, the owner arbitrates. The pose across the pause is unverified: the first ticket plays scene 2 alone.
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
