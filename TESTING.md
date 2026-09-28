# Test scenarios

This mod has never been loaded by RimWorld. Everything below is what the first run has to settle.

**Why the log is nearly useless here, and what replaces it.** The mod is one patch operation and
no def of its own. There is no `defName` to collide, no texture to miss, no `Class=` to resolve
at load. A patch that fails to find its target writes one line and that line is worth searching
for — but a patch that lands writes nothing at all, and a patch that lands *twice* also writes
nothing. So the real test is arithmetic, read off a colonist's stat card, and the whole of this
file uses that reading alongside work timing and save reloads in nine scenarios.

The numbers below were not remembered. `SkillNeed_BaseBonus.ValueAtLevel` was read out of
`Assembly-CSharp.dll` on 2026-09-12 and is exactly `baseValue + bonusPerLevel × level`, with no
clamp of its own; `SkillRecord.GetLevel` returns 0 for a disabled skill and otherwise clamps
level plus aptitude into 0–20; and `StatWorker` uses `StatDef.noSkillFactor`, which defaults to
1 and which `GeneralLaborSpeed` does not override, for any pawn with no skill tracker.

---

## Automated XML regression checks

Run `pwsh -NoProfile -File _tools/Test-Patch.ps1` from the repository root. Use `-GameData`
to select a different RimWorld `Data` directory. The script reads the installed vanilla stat
and the shipped patch, checks both conditional branches, preserves a pre-existing Artistic
entry, verifies the seven curve values below, and checks the documented duplicate-application
behavior. It fails on a missing target or an unexpected XML structure.

This is a standalone XML harness, not RimWorld's patch loader. It does not verify skill
clamping, disabled skills, mechanoids, stat caching, job speed, or save compatibility. What
needs the game is now a Pickle suite, next section. Shared offline checkers additionally verify XML
classes and references; checks limited to declared defs have little coverage for this mod.

Rerun on 2026-09-28 against RimWorld 1.6.4871, all green: `_tools/Test-Patch.ps1` (both branches),
`Check-XmlFields`, `Check-XmlClasses`, `Check-TypeRefs`, `Check-DefRefs`, `Check-ConfigErrors` (0 of 0
defs, which proves nothing about the patch), and `git diff --check`.

## Automated in-game scenarios (Pickle)

The suite is in `Tests/Pickle/` (six features, stock steps only, four passes) and is **written, never
run**. Its `README.md` says what each feature shows, what stays out of Gherkin and why, the passes and their
commands, and the assumptions the first run will confirm or break. Every request goes to the dispatcher
with `Submit-PickleRun.ps1`, never `Run-PickleWsl.ps1` and never the Windows game.

How each of the nine scenarios below is covered. Nothing is left to tick by hand: each one is automated,
or listed not applicable with its reason.

| Scenario | Covered by | Note |
|---|---|---|
| 1. The patch landed | `01-patch-lands`, `02-curve` | Def patched by this mod, one skill need, and the value on a colonist |
| 2. The number is Buitrago's | `02-curve` | Seven levels, 0.3 to 10.3 |
| 3. Applied once, not twice | `01-patch-lands` (count 1), `04`, `05` and `06` (count 2 with another mod) | The `match` branch and the double application are `_tools/Test-Patch.ps1`, offline |
| 4. Level 0 reads 30%, not 10% | `02-curve`, level 0 | |
| 5. The clamp at 20 | not applicable | The clamp is `SkillRecord.GetLevel`, the engine's; the mod's own edge, level 20, is in `02-curve` |
| 6. A colonist who cannot craft | not applicable | `GetLevel` returns 0 for a disabled skill, the engine's, and level 0 of `02-curve` is that same number. The recipes riding the stat are facts of the vanilla defs, read from them |
| 7. Mechanoids and animals | `03-mechanoid` | Needs Biotech, on in the minimal set |
| 8. It speeds up actual work | not applicable | The job divides the work by the stat: vanilla arithmetic on a value `02-curve` asserts. A ratio of two durations needs a local step that Pickle has no assertion for |
| 9. Save compatibility, both directions | added to a colony: `02-curve` (the fixture colony was saved without this mod). Removed from one: not applicable | The mod owns no def and stores nothing in a save, so nothing can go missing; what a removed mod leaves is the engine's |

### What `tested` requires, for this mod

On top of the general gate of `AUDIT.md`, step 9. All must hold for the revision now in the repository:

- **No scenario tagged `@wip`.** There is none today. A scenario put aside is repaired and replayed, or deleted with
  its reason written here.
- **Every conditional scenario has run.** `04`, `05` and `06` carry `@requires`, so they are skipped in the
  minimal pass and count as skipped there. Each has its own pass, with the map that mounts the other mod, and
  its report was read: the suite name and the scenario names checked before citing it, because the report folder
  is shared by the whole machine. **The DeCore pass is blocked** until item 951016023 is on the machine.
- **No manual test left.** The table above is the whole list; a row that turns out to need a person goes back
  to `unverified`.
- **The minimal pass shows three features played of six found**, `exitReason` read first, and a `Player.log`
  read from the start, not only `no errors were logged`.
- **A scenario red on an assumption of the README** (a non-neutral colonist, a count that cannot be read, a mech
  whose factors are not all 1) is a fixture or expectation to correct and replay, not a defect of the mod. A red
  that survives is a defect.
- English and French are not passes here: the mod adds no text.
- Evidence is kept as `Tests/Pickle/README.md` says, one line per run in `docs/runs/README.md`.

## Enabling it

No dependency, no framework, no DLC requirement. The About's `loadAfter` names Core, the five
expansions, DeCore and Stats Matter(continued). The last two are optional: when present, load
them before Renew to preserve the skill-factor list and Renew's entry. Their factors still
multiply with Renew's; see scenario 3.

```
nelim.geniusescraftfast       this mod            check overlaps in scenario 3
```

It is **not** in the current `ModsConfig.xml` (checked 2026-09-28; the file lists 192 mods and none is this
one). `RimWorld/Mods/GeniusesCraftFastRenew` is a junction to `Mod/`. The Pickle staging writes its own
`ModsConfig.xml`, so the suite needs nothing enabled by hand; enable it in the game only for a look of your own.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

These are the exact strings the 1.6 assembly writes, read out of `Assembly-CSharp.dll` rather
than remembered.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `Patch operation` … `failed` | `PatchOperation.Complete` | The operation matched nothing. The message is followed by a `file:` line, so the one to look for names `GeneralLaborSpeed.xml`. It would mean the `StatDef` was not there to patch — another mod removed or renamed it. |
| `Error in patch.Apply():` | `LoadedModManager.ApplyPatches` | An exception rather than a miss, and it aborts the rest of that patch file. |
| `Config error in` … `patch` | `LoadedModManager.ErrorCheckPatches` | A malformed operation, caught before anything is applied. |

**A clean log does not prove that the intended factor is present or present only once.** Read
the stat card in scenarios 1 to 3.

---

## 1. The patch landed

Open any colonist's info card, **Work** category, the line **`vitesse du travail artisanal`**
(`general labor speed`). Click it and read the breakdown.

- There must be a **`Facteurs de compétence`** section naming **`artisanat`**.
- No such section means the patch did not apply, whatever the log says.

## 2. The number is Buitrago's

Same reading, against a colonist whose crafting level you know. The factor is
`0.30 + 0.50 × level`, so the skill line reads:

| Crafting | Factor | Skill line |
|---|---|---|
| 0 | 0.30 | 30% |
| 1 | 0.80 | 80% |
| 2 | 1.30 | 130% |
| 5 | 2.80 | 280% |
| 10 | 5.30 | 530% |
| 15 | 7.80 | 780% |
| 20 | 10.30 | 1030% |

Vanilla is a flat 100% at every level, so **levels 0 and 1 are a loss** and the break-even sits
between 1 and 2. Read the skill factor line itself, not the final percentage at the top: mood,
manipulation and `WorkSpeedGlobal` multiply into that one and will not match the table.

## 3. It was applied once, not twice

The conditional checks whether the **list** `skillNeedFactors` exists. It creates that list
when absent and appends an entry when present. It does **not** check for an existing Crafting
entry and does not make the patch safe to apply twice.

- With Core and this mod, the `Facteurs de compétence` section must list **exactly one**
  Crafting entry, at the value in scenario 2. Vanilla has no `skillNeedFactors` on this stat,
  so the `nomatch` branch runs.
- To exercise `match` independently of Workshop compatibility, use a temporary test patch
  loaded before this mod that creates a `skillNeedFactors` list with a neutral Artistic
  `SkillNeed_BaseBonus` entry (`baseValue` 1, `bonusPerLevel` 0). Expect one Artistic entry at
  100% and one Crafting entry at the table value, inside one XML list. Remove the fixture
  after the test. This verifies that an existing list is preserved.
- In a controlled duplicate test, apply this mod's operation twice to the same definition.
  Expect one list containing **two** Crafting entries. This is the current patch's limitation,
  not evidence that the conditional selected the wrong branch. Do not enable the original mod
  alongside this one for ordinary play.
- `StatWorker.GetValueUnfinalized`, read from the 1.6 assembly on 2026-09-12, multiplies every
  entry's factor; the breakdown prints each entry separately. Two identical entries therefore
  contribute `(0.30 + 0.50 × level)^2`, not twice the factor: 9% at level 0 and 2809% at level
  10, before other multipliers and final stat limits. The final minimum may mask the 9% result.
- With another mod, record its entries without this mod, then enable this mod and check that
  exactly one new Crafting entry appears. Repeat with reversed load order. A mod that creates
  a list unconditionally, replaces it, or removes it can behave differently; the conditional
  here cannot guarantee compatibility with those operations.

**Installed Workshop search, completed 2026-09-12.** The local Workshop folder held 9,743
items. A recursive `rg --no-ignore --hidden --follow` search of XML and C# files for
`GeneralLaborSpeed` completed with exit code 0 and found 9,108 files. Filtering those files
for `skillNeedFactors` or `SkillNeed` produced 13 candidates, all parsed and inspected.
This is a text search of the installed corpus, including old versions, not a search of the
entire online Workshop or an audit of DLLs without sources. The candidate paths relative to
Workshop `content/294100` are saved in [_tools/compatibility-candidates.txt](_tools/compatibility-candidates.txt).

Two mods besides the original actively add a Crafting factor to `GeneralLaborSpeed` in their
installed XML:

| Installed mod | File | Operation and curve | Controlled load-order check |
|---|---|---|---|
| DeCore 1.6 (`Daniledman.DeCore`, item 951016023) | `1.6/Patches/Prod9stats.xml` | Unconditional list add; `1 + 0.03 × level` | Before Renew: one list, two Crafting entries; at level 10 their combined contribution is `1.30 × 5.30 = 6.89`. After Renew: two XML lists are created; the stat card must establish what the loader retained. Neither order preserves Renew's curve alone. |
| Stats Matter(continued) (`StatsMatter.velcroboy333`, item 2208346459) | `Patches/Stats_Pawns_WorkRecipes.xml` | Conditional list creation or replacement; `0.9 + 0.025 × level` | Before Renew: one list, two Crafting entries; at level 10 their combined contribution is `1.15 × 5.30 = 6.095`. After Renew: its replacement removes Renew's entry; expect one Crafting entry at 115% at level 10. |

Both orders were verified offline by applying the actual operations from the three patch files
to a minimal `GeneralLaborSpeed` definition: the list and entry counts and level-10 factors
match the table. These are XML-derived expectations, not completed in-game compatibility tests. Test each mod
separately with Core and its required dependencies, then reverse the order. Do not interpret
two different Crafting entries as a duplicate application of Renew.

The other candidates do not establish another addition to this stat: the original
GeniusesCraftFast is already excluded; DeCore's 1.2–1.5 files repeat its patch; Bulk Stonecutting
(Forked) defines a separate stonecutting stat; Lantern Hunters includes vanilla stat XML in
its source tree; Gloomy Dragonian race supplies a racial stat value; Hauts' Framework uses
`GeneralLaborSpeed` as a factor of another stat; Primitive Tools (Continued) defines separate
work stats and redirects recipes to them. Those recipe redirects can change which jobs
scenario 6 and scenario 8 exercise, even without adding a skill factor to `GeneralLaborSpeed`.

## 4. Level 0 reads 30%, not 10%

`GeneralLaborSpeed` has `minValue 0.1`. That floor is on the finished stat, not on the skill
factor, and 0.30 is above it — so a fresh colonist must read 30% and not 10%. A card showing 10%
means something else on that pawn is stacking underneath.

## 5. The clamp at 20 holds

`SkillRecord.GetLevel` adds aptitude to level and clamps the sum into 0–20. A pawn carrying a
crafting aptitude gene, or an Ideology role granting one, must therefore still read **1030%** and
never more. Worth one dev-mode check because it is the only place the curve could run away.

## 6. A colonist who cannot craft

Set a pawn's crafting to **disabled** — an incapability, or a work type the backstory forbids.
`GetLevel` returns 0 for a totally disabled skill, so that pawn reads **30%** on this stat.

This is the mod's trade and it should be seen once rather than discovered in a colony:

- **Sculpting is on this stat.** `TableSculpting`'s recipe declares `workSpeedStat`
  `GeneralLaborSpeed` with `workSkill Artistic`. A level 20 artist who never crafts sculpts at
  30% speed; the quality is still the artist's.
- **Chemfuel is on this stat and has no skill at all.** `Make_ChemfuelFromWood` declares no
  `workSkill`, yet its speed is now gated by a skill that refining never trains.
- **Cutting stone trains nothing.** `Make_StoneBlocksAny` carries `workSkillLearnFactor 0`, so a
  dedicated stonecutter never climbs out of 30%.
- Cremation, burning apparel, weapons and drugs are all on the same stat.

## 7. Mechanoids and animals are untouched

A pawn with no skill tracker takes `noSkillFactor`, which is 1 and which this stat does not
override. A Biotech work mech at a bench must show **no** `Facteurs de compétence` line for
crafting and no change in speed. The consequence is worth noticing rather than fixing: mechs
become relatively better than a low-skill colonist at every job on this stat.

## 8. It speeds up actual work

The card can be right and the job still not change, so time one bill. Ratios are steadier than
absolute times, because mood and manipulation cancel out of them.

- **Cut stone blocks**, `workAmount` 1600. Same pawn, crafting set to 0, then to 10 in dev mode,
  same bill: the second must take roughly **one seventeenth** of the first (5.30 ÷ 0.30).
- **Make industrial components**, `workAmount` 5000, is the long one to watch if the short bill
  is too quick to time.

## 9. Save compatibility, both directions

The mod adds no def and stores nothing.

- **Added to a running colony:** stat cards change at once, bills already in progress keep their
  remaining work and simply finish faster or slower.
- **Removed from one:** the stat returns to a flat 100%. No missing-def warning on load, because
  there is no def to miss. Confirm on the reload rather than assume it.

---

## What a pass looks like

Scenarios 1 to 3 are the port. Scenarios 4 to 7 are the curve behaving as its author wrote it.
Scenario 8 is the only one that proves the game agrees, and 9 is the promise the README makes to
anyone adding this mid-game.

Nothing here needs a fresh colony. An existing save with one crafter, one artist and dev mode
covers the lot in a single session.
