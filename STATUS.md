---
mod:          Geniuses Craft Fast Renew
packageId:    nelim.geniusescraftfastrenew
repo:         Rimworld-Geniuses-Craft-Fast-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   three places, the About description among them
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
session:      local_ee3236c6-0c0c-4486-8420-7ec19ccd2a13
updated:      2026-09-12, the mod's own session
---

# Geniuses Craft Fast Renew — status

A status sheet, read by a sweep over every mod rather than by asking each thread one at a time.
It lives at the root, never inside `Mod/`, so Steam never receives it.

The sweep deduces from disk what disk can tell it. The four fields it cannot are filled in here
by the thread that holds this mod:

- **`stage: done`** — the content is finished and verified cold. The mod is one patch file and
  two numbers; there is nothing left to write. Five offline checkers pass, on 2026-09-12:
  `Check-XmlFields`, `Check-XmlClasses`, `Check-TypeRefs`, `Check-DefRefs` and
  `Check-ConfigErrors`. The last two have little to chew on, the mod declaring no def of its
  own. What no checker answers is whether the patch finds its target, so that was read straight
  out of the game: `GeneralLaborSpeed` sits in `Core/Defs/Stats/Stats_Pawns_WorkRecipes.xml` and
  carries no `skillNeedFactors`, which is what the conditional was written for — in a vanilla
  game the `nomatch` branch is the one that runs.
- **`tested_on`** — empty, and that is the honest state: RimWorld has never loaded this mod.
  What a first run has to settle is narrow. The patch either applied or it did not, and the
  General labor speed line of a colonist's stat card says which; a level 0 crafter should read
  30% of the vanilla figure and a level 10 one 530%.
- **`dependencies: none`** — literal here. XML only, no assembly, no framework, no DLC
  requirement, and the About's `loadAfter` names nothing but Core and the five expansions. The
  value means the mod needs nothing, as against `declared` when every mod it needs is named in
  the About's `modDependencies`, and `to check` when a non-vanilla `loadAfter` suggests one that
  is not. An undeclared dependency is not cosmetic: on 2026-09-11 Reequilibrage animaux took 47
  vanilla animals down with it, Muffalo included, because the class it injects belongs to a mod
  that was not declared and not loaded.
- **`remaining`** — one entry, `unverified`, for the reason above. There is no known defect and
  no missing feature.

`detached: yes` since 2026-09-12: this folder is its own git repository, on `main`, with one
remote pointing at the public repository above. The monorepo ignores it and tracks none of its
files. The `packageId` gained its `Renew` on the same day, which was only safe because nothing
held the old `nelim.geniusescraftfast`: no Workshop item, no save file, no other mod of hers
naming it, and the one line of `ModsConfig.xml` that did was rewritten.

`licence: silent` — the source declares none. GeniusesCraftFast ships no `LICENSE` file and its
Steam description says nothing about reuse, and it has been abandoned since 11 October 2021, page
still online, no continuation on the Workshop. `licence_at` counts where that is written down:
`ATTRIBUTION.md`'s Licence section, the README's Credit paragraph, and the mod's own description,
which is the one Buitrago would ever see. `<incompatibleWith>` names `Buitrago.GeniusesCraftFast`
and does not move — it is the original's identifier, not this update's.

`showcase: complete` since 2026-09-12: `Mod/About/Preview.png` at 896 × 504 and
`Mod/About/ModIcon.png` at 128 × 128, both built from the full-resolution sources in `Art/` by
`_tools/build-about.sh`. Both are hers, and nothing of the original's presentation is reused; the
icon is the repository's mascot, as `Art/README.md` records.

`workshop` is empty because nothing has been uploaded. The name, the description and the
`packageId` freeze when the Workshop item is created, and `SetItemDescription` never runs again —
so they are worth reading once more on the day rather than after.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
