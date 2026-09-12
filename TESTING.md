# Test scenarios

This mod has never been loaded by RimWorld. Everything below is what the first run has to settle.

**Why the log is nearly useless here, and what replaces it.** The mod is one patch operation and
no def of its own. There is no `defName` to collide, no texture to miss, no `Class=` to resolve
at load. A patch that fails to find its target writes one line and that line is worth searching
for — but a patch that lands writes nothing at all, and a patch that lands *twice* also writes
nothing. So the real test is arithmetic, read off a colonist's stat card, and the whole of this
file is that one reading taken under seven different conditions.

The numbers below were not remembered. `SkillNeed_BaseBonus.ValueAtLevel` was read out of
`Assembly-CSharp.dll` on 2026-09-12 and is exactly `baseValue + bonusPerLevel × level`, with no
clamp of its own; `SkillRecord.GetLevel` returns 0 for a disabled skill and otherwise clamps
level plus aptitude into 0–20; and `StatWorker` uses `StatDef.noSkillFactor`, which defaults to
1 and which `GeneralLaborSpeed` does not override, for any pawn with no skill tracker.

---

## Enabling it

No dependency, no framework, no DLC requirement, and nothing in the About's `loadAfter` but Core
and the five expansions. Position in the list does not matter, with one exception named in
scenario 3.

```
nelim.geniusescraftfastrenew       this mod            anywhere in the list
```

It is already active: line 24 of `ModsConfig.xml`, checked on 2026-09-12. Empty `Player.log`
before the run so the paste is only about this one.

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

**A clean log proves only that the patch was applied, never that it was applied once.** That is
scenario 3.

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

The operation is a conditional precisely so that a second mod adding a skill need to this stat
does not produce two lists, one of which the loader drops in silence.

- The `Facteurs de compétence` section must list **exactly one** crafting entry.
- Two entries, or one entry at double the table value, means the conditional took the wrong
  branch.
- In a list with no other mod touching this stat, the branch that runs is `nomatch`: vanilla's
  `GeneralLaborSpeed` carries no `skillNeedFactors` at all, which is checked and true in 1.6.
- This is the one place load order matters. If a mod that adds a skill need to this stat loads
  **after** this one, it appends to the list this mod created; if it loads **before**, this mod
  appends to its list. Either way the count stays one each. A third entry is the failure.

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
