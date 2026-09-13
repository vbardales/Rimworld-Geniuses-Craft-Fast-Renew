# Art — sources

`Preview-source.png` — the generated banner, **1672 x 941, 1897 KB**. `Mod/About/Preview.png` is
derived from it at **896 x 504**, with the mod name, unofficial tag, summary and supported-version
badge. The source is only 0.06% off 16:9, so the cover fit loses no meaningful content.

`ModIcon-source.png` — **1254 x 1254, 1088 KB**, scaled to **128 x 128** for `Mod/About/`.

`preview.html` is the editable composition. `preview-palette.json` is its only colour palette:
the renderer injects those values, along with the highest version in the shipped About.xml.
The veil comes from the muted wood floor, the secondary ink from the dominant golden-brown
wood and fabric, and the red accent from the distinct red fabric stack beside the worker.
The secondary ink is lightened for contrast; the accent is brightened for the small rule and badge.

To rebuild only the Preview on Windows with Chrome and Segoe UI installed:

```powershell
npm install --prefix _tools
node _tools/build-preview.cjs
```

Set `CHROME_PATH` to use a specific Chromium executable. On other systems, install Playwright's
Chromium (`npx --prefix _tools playwright install chromium`) and provide Segoe UI; the renderer
rejects font substitution. In the Codex bundled runtime, `NODE_PATH` may point to its existing
Node dependencies instead of installing another copy.

The renderer waits for `document.fonts.ready`, checks the actual Segoe UI font through Chrome,
renders at 896 x 504 and losslessly compresses the PNG with Sharp. It verifies text background
contrast at every pixel of each line rectangle, badge contrast and the 1 MB limit before replacing
the shipped Preview. `QA/preview-checks.json` records measurements and geometry;
`QA/preview-background.png` and `QA/preview-268.png` support full-size/thumbnail visual review.
Visual inspection is still required for composition and badge clipping.

`_tools/build-about.sh` invokes this renderer, then rebuilds the icon through ffmpeg.
Always rebuild from the original sources, never from an already-reduced copy.

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
