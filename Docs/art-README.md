# Art — sources

`Preview-source.png` — the generated banner, **1672 x 941, 1897 KB**. `Mod/About/Preview.png` is
derived from it at **896 x 504**, with the mod name, unofficial tag, summary and supported-version
badge. The source is only 0.06% off 16:9, so the cover fit loses no meaningful content.

`ModIcon-source.png` — **1254 x 1254, 1088 KB**, scaled to **128 x 128** for `Mod/About/`.

`echo-preview.png` is the Preview line-art (260 x 260), drawn from `Preview-source.png` only and
flipped by `echo.flipX`, never in the file. `Preview.config.json` holds the copy, the palette, the
panel anchor (bottom-right), the echo and the ModIcon badge (bottom-left, translated -12.5% / +12.5%
so the edges crop it).

Rebuild from the mod root with the shared renderer: `node ../scripts/Render-Preview.cjs`.
It writes `Mod/About/Preview.png`, `Art/Gallery/0-preview.png`, `Art/Preview.ico`, `Art/ModIcon.ico`
and the local checks in `Art/.render/` (ignored by Git). The corner badge shows the highest version
in the shipped About.xml. Always rebuild from the original sources, never from a reduced copy.

## The icon is the repository's mascot

It matches the `ModIcon` block of `STYLE_RIMWORLD.md` line for line: a round cartoon head seen
three-quarter, one eye winking, a small ponytail at the top right, a thick near-black outline, warm
orange, a four-point sparkle on a near-black ground, and two objects that name the mod — a gear and
a wrench — set against the head. The silhouette reads at 32 px as a head with one object beside it.

Two things sit outside the block and are kept: the three speed streaks at the left edge, and the
gradient shading on the head. Neither changes what the silhouette does at 32 px.

**This section said the opposite until 2026-09-11**, and the correction is worth recording. The
`ModIcon` block used to describe a matte object pictogram, "no character, no face" — so this icon
was written up here as a deliberate departure, kept against the guide. That block was the thing
that was wrong: it was rewritten on 2026-09-11 from the sixty icons the repository had actually
shipped, all of them this mascot. The icon never needed defending.

The banner follows the `Preview` block as written, and always did.

RimWorld never reads this folder.
