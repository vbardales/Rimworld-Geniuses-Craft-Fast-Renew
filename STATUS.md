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
session:      local_80aee830-8dba-4482-97b8-4e3d7076c422
updated:      2026-10-25, protocols re-read, Preview regenerated, Evidence sorted, gallery drafts refused, shotlist rewritten (score 3.5, no ticket): shootGallery[1.0.0]
protocols_read_sha: 65f1477c389ca6e741af05b7745aa30f6b26b595
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


## Shotlist (2026-10-25, GALLERY.md criteria; full lines in the header of `07-gallery.feature`)

Story: one afternoon in `preindustrial-workshop`; Nelim (master, Crafting 20) and Miel (apprentice, Crafting 3, needs the owner's authorization and a validated look); the pile grows 1, 4, 6 and carries the stat. Director's pass by an Opus sub-agent: kept the pile count fix, the cell-free frame, chunks for the stonecutter, no hen indoors, Nelim in shot 4, a recomposed closing image, pause ticks written; also kept: the stat card at index 3 (cause before proof) and the closing moved to about 17:00. Nothing rejected.

Owner authorization 2026-10-25: Miel is allowed only in scenes where Nelim appears; otherwise Nelim alone. All five scenes comply (Miel in 1, 4, 5, always with Nelim). Miel's look is not marked OK in LOOKS-VALIDATION.md (owner feedback 2026-10-21 listed a green face tattoo, grey eyes, skin): use her `daily` look with those fixes, check the capture, show it to the owner.

NPT answered 2026-10-25 (nothing played): the stat step becomes "Stats tab scrolled to the stat", a bill step and a spawn-N step will be written (ETA 1 to 2 h), the cells are hidden with `the things "VanometricPower" within 10 cells of (219, 237) are hidden` (the area-empty step would destroy furniture), crafting is a standing pose in vanilla (Nelim stands at the table), the pose across the pause is unverified (start job, let ticks pass, then pause). Estimates stay 3.5 until those steps compile.

| # | a time | b decor | c living | d pawns | e action (instant, how) | f composition | g subject | j mod | estimate | main risk |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 the workshop | 14:00 Clear, +60 | torches, daylily pot, 1 sculpture, granite chunk | Shogun lying | Nelim corset, Highpony; Miel ochre | carve, haul; forced jobs, pause | zoom 6.5 wide, x-shifted frame | two hands, one workshop | pile 1 vs chunk | 3.5 | cells at west edge, work pose step |
| 2 the fourth sculpture | 14:05 +268 | 4 sculptures, block | Shogun lying, head turned | Nelim, focused mouth | next piece started; forced job | zoom 5 medium | the pile grows | 4 sculptures | 3.5 | work pose survives pause |
| 3 the stat card | interface | n/a | n/a | n/a | n/a | window-backdrop-for-height, cropped | 10.3 | the number | not rated | search-box step missing |
| 4 the first club | 14:10 +477 | 1 club, bench | Yuki faces her hands | Nelim passing with a sculpture; Miel | club done, Nelim walks by; forced jobs | zoom 3.2 close, soft foreground | 3 hundredths of the rate | Miel's single club | 3.5 | Miel not authorized |
| 5 the count | about 17:00 +7500 | pile of 6, chair | Shogun toward camera | Nelim carrying #6; Miel seated | pile reached six; forced haul, sits | zoom 4 medium at the door | the day, counted | pile of 6 | 3.5 | needs fed pawns, Miel |

k (series): story written, variety wide/medium/close, opening 1, closing 5, rhythm moves on: ok on paper. Self-score of the shotlist: 3.5 (scenes 3.5 each, below 4): no ticket. Blocking: (1) owner authorization of Miel, plan B Nelim alone; (2) NPT answers on four steps (stat search, work pose, spawn N, hide cells), asked 2026-10-25. Refused 2026-10-25: `1-candidate-three-crafters.png` and the four draft-2 captures (verdicts in the session).
