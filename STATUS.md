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
  - 2026-10-30 ticket 20261025-185730-448-35be (scene 2 alone, 706e311) read: exit 1, failed at step 4, the NPT hide step `the things "VanometricPower" within 10 cells of (219, 237) are hidden` ("No VanometricPower within 10 cells": defName or centre wrong; the cylinders are visible in `Tests/Pickle/Inbox/gallery-s2/screenshots/`). Asked NPT for the exact defName, radius shape and a no-op mode; bill step, forced DoBill and pose across pause still undecided (steps after 4 never ran). Replay scene 2 alone after NPT answers. Then write scenes 1, 4, 5 and the stat-card scenario (GeneralLaborSpeed) from the shotlist, one small ticket each; show Miel look to the owner on the first capture (not OK in LOOKS-VALIDATION.md); delete 1-candidate-three-crafters.png (refused); tested_1_7 not recorded; Evidence/ sorted, Parked/gallery-draft5 waits for a green "three crafters"
  - done 2026-10-11: _tools/build-preview.cjs, build-about.sh, package.json removed (shared Render-Preview.cjs + Art/Preview.config.json replace them); Tests/Test-Patch.ps1 stays (moved from _tools/ on 2026-10-12: AGENTS.md closing pass 3, no `_` folder at the root) (one consumer, emulates two XML operations offline), row in scripts/LOCAL_SCRIPTS.md awaits validation; art-README.md updated 2026-10-13 (shared renderer), Art migration committed
  - justified not_applicable: UI in French. The mod adds no text, so a French pass shows only vanilla strings; no pass planned (AUDIT.md 8.i, 2026-10-11)
  - 2026-10-13 audit 1 to 8 rechecked: Test-Patch.ps1 PASS both branches, git diff --check clean, About.xml deps unchanged, CHANGELOG [Unreleased], no @wip, Art minimal set, root clean, ModIcon.png 128x128 24.8 KB. 8.m reopened by 968b960 (Mod/ images only, no code): code_review_sha set to 968b960 after reading the diff
  - done 2026-10-13: Preview remounted from the shared renderer (panel bottom-right, echo-preview.png, ModIcon badge bottom-left translated -12.5%/+12.5%), validated by Virginie. `echo_review_sha` not set: the echo review belongs to mountPreview, after the accepted gallery
  - 2026-10-15, gallery ticket e6dc result read (exit 1, 4/6 green): "three crafters" judged and promoted to `Art/Gallery/1-candidate-three-crafters.png` (9.d); "Nelim at her bench" and "the apprentice" judged and rejected (camera framed one cell off the subject at zoom 3, pushing it to the frame edge or out of it entirely; fixed in 07-gallery.feature); the two stat-card scenarios failed on an undefined step (PickleTools/InspectTabs was never staged for this pass: @requires and wsl-deps.sanctuary.map fixed). About.xml description's hardcoded "1.6" removed (owner rule 2026-10-13); STATUS.md trimmed 41 KB -> dated sections in docs/runs/history.md; protocols re-read, protocols_read_sha current. Replay filed on 7fc56bd: ticket `20261015-174457-834-a434`, the 4 fixed scenarios, wsl-deps.sanctuary.map
  - feature: PUBLICATION.md (Steam description block, 1.0.0 change note, gallery order, thank-you drafts) is required before tested -> prepublished; the thank-you register has no row yet for the original, DeCore and Stats Matter
session:      local_80aee830-8dba-4482-97b8-4e3d7076c422
updated:      2026-10-30, ticket 20261025-185730-448-35be read (failed at the hide step, NPT asked), protocols re-read: shootGallery[1.0.0]
protocols_read_sha: b2b365f1d31b0c1ae53a5d5d5a695db080c327ce
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


## Shotlist (2026-10-25, revised after rate-gallery 2.0; GALLERY.md criteria; full lines in the header of `07-gallery.feature`)

Story: one afternoon in `preindustrial-workshop`; Nelim (master, Crafting set to 20) and Miel (apprentice, Crafting set to 3). Miel is authorized by the owner (2026-10-25) only in scenes where Nelim is in frame: all staged scenes comply. The pile grows 1, 4, 6; the stat card carries the number. Director's pass by an Opus sub-agent (one call): kept the pile count fix, the cell-free frame, chunks for the stonecutter, no hen indoors, Nelim in scene 4, a recomposed closing image, the card at index 3, a later closing hour (now `I set the hour to 17`, no wait). NPT answered 2026-10-25 (nothing played): stat-card scroll step, bill-on-a-bench step and spawn-N step will be written (ETA 1 to 2 h); cells hidden with `the things "VanometricPower" within 10 cells of (219, 237) are hidden`; crafting is a standing pose; the pose across the pause is unverified (start job, let ticks pass, then pause).

| # | a time | b decor | c living | d pawns | e action (instant, how, pause tick) | f composition | g subject | j mod at 268 px | now | after NPT steps | main risk |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 the workshop | 14:00 Clear, +60 | TorchLamp x3 lit, PlantPot_Bonsai, 1 SculptureSmall, ChunkGranite | Shogun lying | Nelim emerald shirt, brown pants, Highpony, MouthNormal; Miel ochre/sage, curls, MouthClassicSmile | carve and haul; forced job + haul, pause +90 | zoom 5.5, (225, 241), off-centre | two hands, one workshop | opening image: weak | 3.5 | 4.5 | bill step; work pose across pause |
| 2 the fourth sculpture | 14:05, +268 | 4 SculptureSmall loose cluster, block, torch | Shogun lying, head turned | Nelim as in 1, MouthNormal | next piece started; forced job, pause +120 | zoom 5, (221, 243), fg cluster, bg table | the pile grows | cluster = quarter of width | 4.0 | 5.0 | bill step |
| 3 the stat card | interface | n/a | n/a | n/a | n/a | window-backdrop-for-height, cropped | 10.3 | the number | not rated | not rated | scroll step |
| 4 the first club | 14:10, +477 | MeleeWeapon_Club, bench, torch | Yuki sitting, faces her hands | Nelim passing, smirk smile; Miel ochre/sage | club done, Nelim walks by; carries 1 item, crafting job, pause +60 / +120 | zoom 3.2, (225, 244), soft fg | 3 hundredths of the rate | Miel + club 23 px | 4.0 | 5.0 | bill step; Miel's look not OK yet |
| 5 the count | hour 17, no wait | 6 SculptureSmall loose cluster, chair, torches | Shogun toward camera | Nelim carrying #6, smirk smile; Miel seated, club | pile reached six; forced haul + sits, pause +80 / +60 | zoom 4, (224, 241), looking in | the day, counted | cluster of six + Shogun | 5.0 | 5.0 | seated job under pause unverified |

k (series): ok on paper: one story (who, where, day, rhythm), wide 1, medium 2 and 5, close 4, card 3, opening 1, closing 5. Self-rating by the rule of rate-gallery (to be confirmed by `/rate-gallery`): mean 4.1 now, 4.9 once NPT's steps exist. Scene 1 is 3.5 now: no ticket until NPT's bill step compiles and every staged scene is 4 or more. First ticket: scene 2 alone (checks the pose across the pause). Blocking: NPT's three steps; Miel's look (not OK in LOOKS-VALIDATION.md, shown to the owner on the first capture). Refused 2026-10-25: `1-candidate-three-crafters.png` (not deleted yet) and the four draft-2 captures.
