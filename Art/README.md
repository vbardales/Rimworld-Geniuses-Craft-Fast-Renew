# Art — sources

`Preview-source.png` — the generated banner, **1672 x 941, 1897 KB**. `Mod/About/Preview.png` is
derived from it: scaled to **896 x 504** with the mod name and a summary line engraved over the
dark upper-left corner, 587 KB. The source is only 0.06% off 16:9, so nothing is cropped away.

`ModIcon-source.png` — **1254 x 1254, 1088 KB**, scaled to **128 x 128** for `Mod/About/`.

Both files are rebuilt by `_tools/build-about.sh`, which renders `_tools/preview.html` in headless
Chrome at exactly 896 x 504 — the text is therefore composed at its final size and its glyphs are
never resampled — and re-encodes through ffmpeg, because Chrome's own PNG came out at 1.2 MB.
Always rebuild from these sources, never from an already-reduced copy.

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
