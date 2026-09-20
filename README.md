# Geniuses Craft Fast Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

A RimWorld 1.6 adaptation of **GeniusesCraftFast** by Buitrago
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
    ATTRIBUTION.md                     what is Buitrago's, what the adaptation changed
    CHANGELOG.md                       release notes
    TESTING.md                         what the first run in game has to settle
    LICENSE                            MIT, over the adaptation work only

## Testing it

The log settles almost nothing here. One patch operation and no def of its own means a patch that
lands writes nothing, and a patch that lands twice writes nothing either. The reading that decides
is the skill factor line on a colonist's stat card, and [TESTING.md](TESTING.md) holds the nine
scenarios that take it — including the one worth reading before playing, since sculpting, chemfuel
and cremation all ride this stat and cutting stone grants no crafting experience at all.

## Retuning it

Both numbers live in `Mod/Patches/GeneralLaborSpeed.xml`, in **both branches** of the conditional —
change one branch only and the mod behaves differently depending on which other mods are loaded.

## Credit

The mod is Buitrago's. The adaptation is mine, and so is any mistake in it. If the original author
returns to it or asks for this to come down, it comes down.
