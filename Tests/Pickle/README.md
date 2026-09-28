# In-game scenarios, run by Pickle

This companion is development-only: it lives beside `Mod/`, never inside it, and Steam never receives it.
It turns the checks of `../../TESTING.md` that only a running game can settle into scenarios.

**Status: written, never run.** Every step is a stock Pickle step, matched by hand against Pickle's catalogue
on 2026-09-28; there is no local C# and no PickleTools companion, so nothing to build. Running the suite is
the work of `done -> tested`, not of `done`. The list at the end names what the first run will confirm or break.

## What is in Gherkin, and why it needs a game

`../../_tools/Test-Patch.ps1` and the shared checkers already prove what a file can prove: the two branches of
the conditional, the seven curve values, an existing list preserved. Nothing below repeats them. Each feature
exists because the game's loader, stat worker and pawn generator have to act on the patch.

| Feature | Pass | What it shows | Why it cannot be an offline test |
|---|---|---|---|
| `01-patch-lands` | minimal | The loader kept exactly one skill need on `GeneralLaborSpeed`, written by this mod | A patch that lands writes nothing to the log, and one that lands twice writes nothing either; only the def after the loader shows it |
| `02-curve` | minimal | Crafting 0, 1, 2, 5, 10, 15 and 20 read 0.3, 0.8, 1.3, 2.8, 5.3, 7.8 and 10.3 on a colonist | Only the game's `StatWorker` and `SkillRecord.GetLevel` turn the entry into a pawn's value, and the fixture colony is the mod added to an existing colony |
| `03-mechanoid` (`@requires` Biotech) | minimal | A constructoid reads a flat 1: no skill tracker, no Crafting factor | The `noSkillFactor` fallback is in the stat worker |
| `04-decore` (`@requires` DeCore) | avec-decore | With DeCore before this mod, two entries and 1.30 x 5.30 = 6.89 at crafting 10 | Load order between two mods is only the game's |
| `05-statsmatter` (`@requires` Stats Matter) | avec-statsmatter | With Stats Matter before this mod, two entries and 1.15 x 5.30 = 6.095 | Same |
| `06-original-incompatible` (`@requires` the original) | incompat-original | With the original loaded, two identical entries and 5.30 x 5.30 = 28.09: the declared incompatibility still behaves as declared | Same, and the claim ages with the other mod |

## What is deliberately not in Gherkin

| Check | Where it went | Why |
|---|---|---|
| The `match` branch of the conditional, an existing list preserved | `_tools/Test-Patch.ps1` | Two XML operations on a def, no game needed |
| Applying the operation twice gives two entries | `_tools/Test-Patch.ps1` | Same; a documented limitation, not something the game can add |
| Sculpting, chemfuel, cremation and burning riding the same stat; cutting stone granting no experience | a read of the vanilla recipes (`workSpeedStat`, `workSkill`, `workSkillLearnFactor`) | Facts about vanilla defs, read from them |
| A colonist who cannot craft reads 0.3 | none | `SkillRecord.GetLevel` returns 0 for a disabled skill, which is the engine, and level 0 of `02-curve` is the same number. Replaying it tests the game |
| The clamp at 20 with an aptitude | none | The clamp is `GetLevel`, the engine's. The mod's own edge, level 20, is in `02-curve` |
| A bill finishing faster, seventeen times faster at crafting 10 than at 0 | none | The job reads the stat and divides the work by it: vanilla arithmetic on a value `02-curve` already asserts. A ratio of two durations also needs a local step, and Pickle has no timing assertion |
| Removing the mod from a running colony | none | The mod owns no def, no comp and stores nothing in a save, so a save made with it holds nothing that could go missing. What a removed mod leaves behind is the engine's handling of a dropped mod. The stat returning to 1 is the same arithmetic as a colony that never had the mod |
| The engine's own incompatibility warning, and its load-order sort | none | The game's responsibility, not the mod's. The mod answers for its declaration, checked in `About.xml` |
| The stat card in English and French | none | The mod adds no text: the section title and the skill name are vanilla keys. `localization` is `not_applicable`, see `STATUS.md` |

## Passes

A mod is validated after at least two passes, and the report says which is which. `-DepMap` names the
pass; without it no map is read, which is the minimal pass.

| Pass | Command | Features that run |
|---|---|---|
| minimal | no `-DepMap` | `01`, `02`, `03` (`03` also needs Biotech, on in the minimal set) |
| avec-statsmatter | `-DepMap wsl-deps.avec-statsmatter.map`, `-Filter '05-statsmatter'` | `05` |
| avec-decore | `-DepMap wsl-deps.avec-decore.map`, `-Filter '04-decore'` | `04`; prerequisite unmet, see below |
| incompat-original | `-DepMap wsl-deps.incompat-original.map`, `-Filter '06-original-incompatible'` | `06` |

Each pass is one request to the dispatcher. `01` and `02` are not meant to run in the three optional passes:
with another mod adding a skill need, the list holds two entries and the curve is no longer 0.30 + 0.50 x level.
The minimal pass runs the whole suite, and `@requires` skips `04`, `05` and `06`. A skipped scenario is not a
passed one, so its report must show three features played of six found.

The three optional passes are compatibility claims of `About.xml`: `loadAfter` for DeCore and Stats Matter,
`incompatibleWith` for the original.

## Assumptions the first run will confirm or break

- **The generated colonist is neutral.** `02` and the three pass features read `WorkSpeedGlobal` first and
  expect 1, so a fixture that is not neutral fails by name and not as a wrong curve. Traits are random. If it
  fails, the fix is in the fixture (a step that removes the traits), not in the expected values.
- **`skillNeedFactors.Count` is readable** by Pickle's own `def ... field ...` step, which walks public fields
  and properties of the def. If the step refuses a list, use PickleTools' `DefFieldSteps` (a companion, one
  line in a pass map) or drop the count and rely on the product of the factors.
- **The staged load order is the map's order, and the mod under test comes last.** The passes depend on it, as
  in the sibling suites: `mod ... loads before ...` asserts it.
- **A constructoid's own factors are all 1.** Scenario `03` expects exactly 1.
- **The staging keeps the original mod** despite its 1.3-only `supportedVersions`.
- **DeCore is missing.** Item 951016023 is in neither the Windows Workshop folder nor the WSL cache. A pass that
  cannot stage it is not a defect of the mod.

## Evidence

Launch every request with `-EvidenceDir GeniusesCraftFastRenew/Tests/Pickle/Evidence/<pass>-<language>-<sha>`,
so the report is copied into this repository before the next run overwrites the shared folder. That folder is
ignored by git and stays on disk.

What is worth keeping once a run is read, and everything else goes:

- keep `summary.md`, `summary.json`, `junit.xml`, `Player.log` and `evidence-complete.txt` of the **latest run per
  pass and language, for the revision now in the repository**, and an older one only if it is the sole proof of a
  check the latest did not repeat;
- delete `report.html` and `messages.ndjson` at once (derived, tens of megabytes), and the failure captures;
- this suite has **no `@review` scenario and takes no screenshot**, so there is no picture to keep. If one is
  added, keep only the captures somebody opened, minified with `Minify-Evidence.ps1`, never a whole `screenshots/`;
- add one text line per run to `../../docs/runs/README.md`, and never a folder;
- never delete an evidence folder that `STATUS.md` points at: repoint first. List what goes and what stays before
  deleting anything.

Read `exitReason` before the counts, and compare the features found with the features played.
