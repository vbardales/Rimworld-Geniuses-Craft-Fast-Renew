# Geniuses Craft Fast Renew

A RimWorld 1.6 update of **GeniusesCraftFast** by Buitrago
([Steam 2625574564](https://steamcommunity.com/sharedfiles/filedetails/?id=2625574564), 1.3,
last updated 11 October 2021).

The mod ties the vanilla **General labor speed** stat to the Crafting skill:

    factor = 0.30 + 0.50 × crafting level

30% at level 0, 130% at level 2, 1030% at level 20. Vanilla leaves that stat free of any skill
need on purpose — it is the stat for recipes where skill already decides the quality of the
output — so this is a deliberate reversal, not a fix.

XML only: one patch file, no assembly, no dependency, no def of its own. Safe to add to an
ongoing save, and safe to remove from one.

Do not run it alongside the original mod; `<incompatibleWith>` declares the clash.

## Layout

    Mod/                               the published folder - this is what Steam receives
      About/About.xml                  metadata and the Workshop description
      About/ModIcon.png                128x128, shown at 32 px in the mod list
      Patches/GeneralLaborSpeed.xml    the whole mod
      LICENSE, ATTRIBUTION.md          copies: Steam ships the folder, not the repo
    Art/                               full-resolution image sources, never published
    ATTRIBUTION.md                     what is Buitrago's, what the update changed
    CHANGELOG.md                       release notes
    LICENSE                            MIT, over the update work only

## Retuning it

Both numbers live in `Mod/Patches/GeneralLaborSpeed.xml`, in **both branches** of the conditional —
change one branch only and the mod behaves differently depending on which other mods are loaded.

## Credit

The mod is Buitrago's. The update is mine, and so is any mistake in it. If the original author
returns to it or asks for this to come down, it comes down.
