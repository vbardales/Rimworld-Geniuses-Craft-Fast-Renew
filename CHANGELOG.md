# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display
it in game.

## [1.0.0] — unreleased

On release: create the `v1.0.0` tag and the matching GitHub release.

First release of the 1.6 update of Buitrago's **GeniusesCraftFast [1.3]**, last updated
11 October 2021. The mod is two files and one patch operation; the update is small by nature,
and most of the work was checking that it did not need to be larger.

### Added

- Support for RimWorld 1.6. Checked against 1.6.4871.
- `LICENSE`, MIT over the update work alone.
- `ATTRIBUTION.md` and this changelog, recording what the original does and what the update
  touched.

### Changed

- **The patch no longer assumes it is alone on the stat.** `GeneralLaborSpeed` carries no
  `<skillNeedFactors>` in vanilla, so the node has to be created; the original created it
  unconditionally. Any other mod adding a skill need to the same stat first would leave the def
  with two such nodes, one of them silently dropped at load. A `PatchOperationConditional` now
  appends to an existing list, and creates the list only when there is none.
- **`packageId`** is `nelim.geniusescraftfast`, with `<incompatibleWith>` on
  `Buitrago.GeniusesCraftFast` so the two cannot run together.
- **`Patches/Patch.xml` renamed `Mod/Patches/GeneralLaborSpeed.xml`**, after what it patches.

### Notes

The author's numbers are untouched: `0.30 + 0.50 × crafting level`, 30% at level 0 and 1030% at
level 20. The consequences of that curve — sculpting and cremation ride the same stat, and the
DLCs keep adding recipes to it — are documented in `ATTRIBUTION.md` rather than balanced away.

Nothing in the 1.3 → 1.6 gap touched this mod: the stat, its lack of a vanilla skill need, the
`SkillNeed_BaseBonus` class and the `skillNeedFactors` field all survived unchanged, and the
stat's in-game description is still word for word the one quoted in the 2021 description.
