# The pictures of the Workshop page, in the order to upload them (AUDIT.md step 9, GALLERY.md). A green run proves only that the route ran:
# every image is opened and judged against this plan.
#
# The mod adds one thing: a crafter's General Labor Speed grows with the Crafting skill, 0.30 + 0.50 x level (0.3 at level 0, 10.3 at level 20).
# That number is invisible on a map, so the series has two kinds of pictures: staged photographs of a workshop where the crafting skill shows in who
# has made what, and the stat card ("i" button, Stats tab), a screen capture of what it is and not staged.
#
# The story: one noon in the preindustrial workshop of the sanctuary, three people at the benches, an apprentice who is starting out (Crafting 0), a
# journeyman (Crafting 10) and Nelim, the master (Crafting 20). Time unfolds in the game: every picture starts at noon, and waits 5 more game minutes
# than the one before (12:00, 12:05, 12:10, 12:15; 2 500 ticks make an hour, so about 208 ticks per 5 minutes, plus 60 to settle), clear sky.
# Nelim is Virginie, the only colonist of the fixture. Other people are generated for the scene. Daytime animals only.
#
# Shot plan (place: `preindustrial-workshop`, centre (223, 237), zoom 8.5, room x 218-228, z 230-244; benches along the north wall, the west wall and the
# east wall; the chairs seen on the place's photograph are at about (221, 243), (224, 243), (219, 238), (219, 235), (227, 237), (227, 233), (225, 231)):
#   1. 12:00, wide frame. The three crafters at three benches; in front of each a stack of what they have made so far: one for the apprentice, a few
#      for the journeyman, a tall one for the master. The photograph says "the more you know, the more you make". A dog lies near the apprentice.
#   2. 12:05, close frame on Nelim at her bench (zoom 3), her stack beside her, a hen pecking at the tiles. The master at work, in the series' common coat.
#   3. 12:10, close frame on the apprentice (zoom 3), one item in front of her: the same noon, the same bench, three hundredths of the rate.
#   4. 12:15, the information card of Nelim, Stats tab, a screen capture on the backdrop of the window.
#   5. 12:15, the information card of the apprentice, Stats tab: the same card at Crafting 0.
#
# This first pass is a draft played to read the place: the benches are the ones of the save and their positions come from a photograph, so the
# first run logs what stands where (the buildings of the room) and the pictures are judged and recomposed from it.
#
# Ticket 20261013-131234-255-e6dc (gallery-draft1, 2026-10-13): 4/6 green (scenarios 1-3, 0 "recon"). The two stat-card
# scenarios failed on an undefined step: `Nelim's Pickle Tools: I open the info card...` lives in
# PickleTools/InspectTabs, a module the pass's wsl-deps map did not stage (only its packageId was missing from
# @requires and the map, not a problem with the step itself). Fixed 2026-10-15: scenario-level @requires added below,
# and `nelim.pickletools.inspecttabs` added to wsl-deps.sanctuary.map.
#
# Images judged (AUDIT.md 9.d), 2026-10-15: "workshop 1 - three crafters" is usable as-is (the three colonists and their
# material are in frame, against the recon log's real furniture positions). "workshop 2" and "workshop 3" show the wrong
# thing: `I frame the cell` centers the camera exactly on that cell (confirmed in CameraZoomSteps.cs), but each scenario
# framed a cell one away from its own subject's stand position, at zoom 3 close enough to push the subject out of frame
# entirely (workshop 3) or to its very edge (workshop 2). Fixed: the framed cell now equals the subject's own stand cell
# in both scenarios. Not replayed yet.
#
# Caveat kept open, not fixed here: `I spawn a "Steel" at (x, z)` drops one stack per call, the same size at every
# position, so scenario 1 cannot actually show "a few" vs "a tall one" by stack size as its own comment (shot 1) claims
# - only the colonists' positions and the room itself carry the story. A quantity-aware spawn step, if Pickle has one,
# was not looked up for this pass; left for whoever revisits the shot list.
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
    And "Joss" skill "Crafting" is set to level 10
    And "Nelim" skill "Crafting" is set to level 20
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Mina" stands at (224, 243) facing North
    And Nelim's Pickle Tools: "Joss" stands at (227, 238) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (221, 243) facing North
    And Nelim's Pickle Tools: the other colonists are out of frame
    And I spawn a "Steel" at (224, 242)
    And I spawn a "Steel" at (226, 238)
    And I spawn a "Steel" at (226, 237)
    And I spawn a "Steel" at (220, 242)
    And I spawn a "Steel" at (221, 242)
    And I spawn a "Steel" at (222, 242)
    And I spawn a "Steel" at (222, 241)
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
    And I spawn a "Steel" at (220, 242)
    And I spawn a "Steel" at (221, 242)
    And I spawn a "Steel" at (222, 242)
    And I spawn a "Steel" at (222, 241)
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
    And Nelim's Pickle Tools: "Mina" stands at (224, 243) facing North
    And Nelim's Pickle Tools: the other colonists are out of frame
    And I spawn a "Steel" at (224, 242)
    And Nelim's Pickle Tools: I frame the cell (224, 243) at zoom 4.0
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
