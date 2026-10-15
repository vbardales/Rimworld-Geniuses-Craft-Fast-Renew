---
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
settings_audit: not_applicable
mod:          Geniuses Craft Fast Renew (unofficial)
packageId:    nelim.geniusescraftfast
repo:         Rimworld-Geniuses-Craft-Fast-Renew
visibility:   public
detached:     yes
workflow_stage: shootGallery[1.0.0]
code_review_sha: 968b960cb7059f4cf7d2c0e3b5862766f6fa4487
licence:      silent
adaptation_licence: MIT, adaptation work only; see LICENSE
licence_at:   three places, the About description among them
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    RimWorld 1.6.4871 (Pickle, WSL), 2026-09-28 to 09-30, English only: minimal pass 9/0/3 at e4fd722 (exitReason passed), conditional passes avec-decore, avec-statsmatter, incompat-original 1/0/0 each at aa5f14b
workshop:     3806761999 (private item created by the 0.1.0 upload of 2026-09-23; PublishedFileId.txt committed in 1692def)
remaining:
  - done 2026-10-11: _tools/build-preview.cjs, build-about.sh, package.json removed (shared Render-Preview.cjs + Art/Preview.config.json replace them); Tests/Test-Patch.ps1 stays (moved from _tools/ on 2026-10-12: AGENTS.md closing pass 3, no `_` folder at the root) (one consumer, emulates two XML operations offline), row in scripts/LOCAL_SCRIPTS.md awaits validation; art-README.md updated 2026-10-13 (shared renderer), Art migration committed
  - justified not_applicable: UI in French. The mod adds no text, so a French pass shows only vanilla strings; no pass planned (AUDIT.md 8.i, 2026-10-11)
  - 2026-10-13 audit 1 to 8 rechecked: Test-Patch.ps1 PASS both branches, git diff --check clean, About.xml deps unchanged, CHANGELOG [Unreleased], no @wip, Art minimal set, root clean, ModIcon.png 128x128 24.8 KB. 8.m reopened by 968b960 (Mod/ images only, no code): code_review_sha set to 968b960 after reading the diff
  - done 2026-10-13: Preview remounted from the shared renderer (panel bottom-right, echo-preview.png, ModIcon badge bottom-left translated -12.5%/+12.5%), validated by Virginie. `echo_review_sha` not set: the echo review belongs to mountPreview, after the accepted gallery
  - 2026-10-15, gallery ticket e6dc result read (exit 1, 4/6 green): "three crafters" judged and promoted to `Art/Gallery/1-candidate-three-crafters.png` (9.d); "Nelim at her bench" and "the apprentice" judged and rejected (camera framed one cell off the subject at zoom 3, pushing it to the frame edge or out of it entirely; fixed in 07-gallery.feature); the two stat-card scenarios failed on an undefined step (PickleTools/InspectTabs was never staged for this pass: @requires and wsl-deps.sanctuary.map fixed). About.xml description's hardcoded "1.6" removed (owner rule 2026-10-13); STATUS.md trimmed 41 KB -> dated sections in docs/runs/history.md; protocols re-read, protocols_read_sha current. Replay filed on 7fc56bd: ticket `20261015-174457-834-a434`, the 4 fixed scenarios, wsl-deps.sanctuary.map
  - feature: PUBLICATION.md (Steam description block, 1.0.0 change note, gallery order, thank-you drafts) is required before tested -> prepublished; the thank-you register has no row yet for the original, DeCore and Stats Matter
session:      local_ee3236c6-0c0c-4486-8420-7ec19ccd2a13
updated:      2026-10-15, gallery ticket e6dc read and judged, camera and @requires fixes made, replay a434 filed: shootGallery[1.0.0]
protocols_read_sha: 6eeb289af92096fa3a7ee40825e3b5221030873d
---

# Geniuses Craft Fast Renew — status

## Current state — shootGallery[1.0.0]

Gates 1 (`setupRepo`) through 8 (`playTests` -> `shootGallery`) are valid, rechecked 2026-10-11 and 2026-10-13
against the current fifteen-state `AUDIT.md`. `code_review_sha: 968b960` covers `Mod/` through the Preview remount
(images only, no code, AUDIT.md 8.m's exception). Earlier audits and Pickle runs are folded to one line each in
`docs/runs/history.md` and `docs/runs/README.md`; this section states only what still holds.

- Settings: `settings_audit: not_applicable` — no page, no shortcut, the fixed curve is the mod's purpose.
- Localization: `not_applicable` — the mod adds no text (re-checked 2026-09-30 by search, 2026-10-11 by
  `FRENCH_REVIEW.md`); no French pass is planned (AUDIT.md 8.i).
- Tests: `Tests/Test-Patch.ps1` and the six-feature Pickle suite are green jointly across all four passes
  (minimal, avec-statsmatter, incompat-original, avec-decore); see `tested_on` and `docs/runs/README.md`.
- Gallery (state 9, `shootGallery`): ticket `20261013-131234-255-e6dc` read 2026-10-15 (exit 1, 4/6 green). One
  capture judged and promoted (`Art/Gallery/1-candidate-three-crafters.png`); two rejected on a camera-framing bug,
  now fixed; two stat-card scenarios failed on an unstaged PickleTools module, now added to the dep map. Not
  replayed yet; still only one real candidate beside the `0-preview.png` copy.
- Next after the gallery: `mountPreview` (echo from the accepted captures), `writeDocs` (`PUBLICATION.md`,
  thank-you register rows for the original, DeCore and Stats Matter), then `prepareRelease` and `publish`.
- Finding, not a defect, not in the suite: De-generalize Work (`Alias.DegeneralizeWork`, Workshop 2011655761) gives
  `GeneralLaborSpeed` a `Name` and three child stats with no `skillNeedFactors` of their own; patches run before
  inheritance, so those three would inherit this mod's Crafting entry. Needs Vanilla Skills Expanded; neither mod
  is active now. Worth a pass only if the owner runs both.

