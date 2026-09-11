# Attribution

## GeniusesCraftFast [1.3]

- **Original author:** Buitrago
- **Source:** Steam Workshop `2625574564`, last supported version 1.3, last updated
  11 October 2021 — https://steamcommunity.com/sharedfiles/filedetails/?id=2625574564
  The page is still online. The mod is abandoned, not withdrawn, and no continuation of it
  exists on the Workshop.
- **Reused here:** the whole mod — which is one `PatchOperationAdd` and the two numbers in it.

## Licence

**No licence is declared**: the mod ships no `LICENSE` file, and its Steam description says
nothing about reuse. It is republished under the usual practice for abandoned mods — explicit
credit, a link to the original, and removal on request. That is stated in the mod's own
description, not only here.

If Buitrago asks for this to come down, it comes down.

## What the original mod is

Two files. `About/About.xml`, and a `Patches/Patch.xml` that adds one skill need to the vanilla
`GeneralLaborSpeed` stat:

```xml
<li Class="SkillNeed_BaseBonus">
  <skill>Crafting</skill>
  <baseValue>0.30</baseValue>
  <bonusPerLevel>0.50</bonusPerLevel>
</li>
```

Multiplier = `0.30 + 0.50 × level`. 0.30 at level 0, 1.30 at level 2, 10.30 at level 20. Vanilla
leaves this stat free of any skill need on purpose: it is the stat for recipes where the skill
already decides the **quality** of the output, so letting it decide the speed as well is exactly
the change the mod exists to make.

## What was changed

| Point | Decision |
|---|---|
| `supportedVersions` | `1.3` → `1.6`. |
| `PatchOperationAdd` on a missing `<skillNeedFactors>` | Replaced by a `PatchOperationConditional`: add to the list if one exists, create it otherwise. See below. |
| `packageId` | `Buitrago.GeniusesCraftFast` → `nelim.geniusescraftfast`, with `<incompatibleWith>` on the original so the two cannot run together. |
| `Patches/Patch.xml` | Renamed `Mod/Patches/GeneralLaborSpeed.xml`, after what it patches. |

**The conditional is the only real change.** Vanilla's `GeneralLaborSpeed`
(`Core/Defs/Stats/Stats_Pawns_WorkRecipes.xml`) has no `<skillNeedFactors>` node at all, so the
node has to be created rather than appended to. The original always created it. If any other mod
adds a skill need to the same stat first, the def then carries **two** `<skillNeedFactors>` nodes
and one of them is silently dropped at load — with no error to say which, or that anything was
lost. The patch now tests for the node and takes the appropriate branch.

## What did not need changing, and why that is worth writing down

Nothing else. The 1.3 → 1.6 gap left this mod alone at every point it touches:

- **`GeneralLaborSpeed` still exists**, and still carries no skill need of its own. Its
  description in 1.6 is word for word the one Buitrago quoted in the 2021 mod description.
- **`SkillNeed_BaseBonus` still exists** (`RimWorld.SkillNeed_BaseBonus`), with the same
  `baseValue` / `bonusPerLevel` fields. Vanilla itself uses it on `MechFormingSpeed`,
  `MechRepairSpeed` and `SubcoreEncodingSpeed`, all three on the Crafting skill.
- **`skillNeedFactors` is still the field name** on `StatDef`.

Checked against RimWorld 1.6.4871.

## Mechanoids

`StatWorker.GetValueUnfinalized` reads:

```
if (pawn.skills != null)   → apply every skillNeedFactors entry
else                       → multiply by stat.noSkillFactor
```

Mechs have no `Pawn_SkillTracker`, so they take the `noSkillFactor` branch and this mod does not
reach them. Verified in the IL of 1.6.4871, not assumed.

## The balance, left as it was

**A ten-fold multiplier is enormous, and 0.30 at level 0 is a real tax.** Both are the author's,
and the port keeps them. Two consequences worth knowing before enabling it:

- **It is not only crafting.** `GeneralLaborSpeed` is also the speed of sculpting, of building
  musical instruments, of cremation and of smelting. A dedicated artist with Crafting at 0 works
  at 30% of vanilla speed on their own sculptures.
- **The reach grows with the DLCs.** Royalty, Ideology, Biotech, Anomaly and Odyssey all add
  recipes and benches on this stat. They were not there in 2021; they pick the bonus up anyway.

Retuning is two numbers in `Mod/Patches/GeneralLaborSpeed.xml`, in both branches of the conditional.
