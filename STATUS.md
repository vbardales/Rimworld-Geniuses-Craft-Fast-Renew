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
code_review_sha: 4130f9f6a286a390afec6e162ddd0d74674f044d
licence:      silent
adaptation_licence: MIT, adaptation work only; see LICENSE
licence_at:   three places, the About description among them
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    RimWorld 1.6.4871 (Pickle, WSL), 2026-09-28 to 09-30, English only: minimal pass 9/0/3 at e4fd722 (exitReason passed), conditional passes avec-decore, avec-statsmatter, incompat-original 1/0/0 each at aa5f14b
workshop:     3806761999 (private item created by the 0.1.0 upload of 2026-09-23; PublishedFileId.txt committed in 1692def)
remaining:
  - 2026-10-30 replay-audit 1 to 8 done, stage unchanged: 8.m reopened by 4869f3a (Preview.png) and the About.xml description wording; `git diff 968b960 HEAD -- Mod` read: images and description text only, no patch change (Mod/Patches last touched before aa5f14b, the tested sha); code_review_sha set to c4b202b (revue du diff : images et texte seuls). Weak proofs (STATUS.md only): 4.g dependencies record, Test-Patch.ps1 PASS of 2026-10-13 (LOCAL_SCRIPTS row not validated, not rerun)
  - 2026-10-30 ticket 20261025-185730-448-35be (scene 2 alone, 706e311) read: exit 1, failed at step 4, the NPT hide step `the things "VanometricPower" within 10 cells of (219, 237) are hidden` ("No VanometricPower within 10 cells": defName or centre wrong; the cylinders are visible in `Tests/Pickle/Inbox/gallery-s2/screenshots/`). NPT answered: match is exact on defName (spawned things only), radius is a square, new steps `the things within N cells of (x, z) are listed` (attaches `things-near`) and `... are hidden when present` (compiled, not played). Scene 2 now lists the things within 12 cells of (222, 243) then hides tolerantly; ticket `20261030-161203-412-cbc0` filed (evidence `Tests/Pickle/Inbox/gallery-s2-b`): read the `things-near` attachment, fix the defNames and centre, and read bill step, forced DoBill and pose across the pause (steps after 4 never ran in 35be). Then write scenes 1, 4, 5 and the stat-card scenario (GeneralLaborSpeed) from the shotlist, one small ticket each; show Miel look to the owner on the first capture (not OK in LOOKS-VALIDATION.md); delete 1-candidate-three-crafters.png (refused); tested_1_7 not recorded; Evidence/ sorted, Parked/gallery-draft5 waits for a green "three crafters"
  - 2026-11-10 resume: Preview re-rendered (Preview.png last committed 2026-10-25, before the 2026-11-03 echo.width/height removal; config migrated to the current format: `background`, `panel.description`, `suffix`), opened and checked (echo clear of title, no clipping); `Art/Gallery/0-preview.png` follows. Ticket `20261030-161203-412-cbc0` (scene 2 alone, listing step) ended 2026-11-03: exit 1, failed at `I place the decor "TorchLamp" at (220, 245)` ("the cell (220, 245) already holds Wall"), so the hide and listing steps passed; evidence `Tests/Pickle/Inbox/gallery-s2-b` (one screenshot, step18). Next: read the `things-near` attachment in `messages.ndjson`, move the torch off the wall cell, replay scene 2 alone. Protocols re-read (diffs of GALLERY.md, STYLE_RIMWORLD.md, AUDIT.md, PICKLE.md): new at shootGallery = subtitled copies in `Art/Gallery/` and clean originals in `Art/Gallery-clean/`, one final review by the owner, `REDO` if any of the four image notes is under 4/5 or criterion j is weak at 268 px, Check-ShotlistVsScenario.ps1 before any ticket
  - 2026-11-10 `things-near` of cbc0 read: workshop interior x 218..226, z 239..244; south wall row z=245 (x 218..226), west wall x=217; sculpting table already at (221, 244); free cells near the table (220..223, 242..244 except chairs/Shogun). Torch moved (220, 245) to (223, 244) in scene 2 and header (c70d502). Ticket `20261110-003331-160-6a00` filed (scene 2 alone, evidence `Tests/Pickle/Inbox/gallery-s2-c`): read bill step, forced DoBill and pose across the pause. Check-ShotlistVsScenario: shot 2 clean; shots 1, 4, 5 flagged (scenes not written yet, old drafts matched by order), so no ticket for them yet. Old evidence `gallery-s2` and `gallery-s2-b` kept until 6a00 is read
  - 2026-11-10 ticket `20261110-003331-160-6a00` (scene 2 alone) read: exit 1, failed at `I place the decor "TorchLamp" at (223, 244)` ("already holds DrugLab": DrugLab is a 3-cell bench at (224, 244), x 223..225; sculpting table (221, 244) x 220..222; wall lamps already at (221, 244) and (224, 244)). Torch moved to (223, 243) (free: chairs at (221, 243) and (224, 243)), scene 2 and header updated; replay ticket `20261110-061307-347-0605` filed at c6b3eca (scene 2 alone, `-DepMap wsl-deps.gallery.map`, evidence `Tests/Pickle/Inbox/gallery-s2-d`; old evidence `gallery-s2`, `-b`, `-c` kept until it is read). Bill step, forced DoBill and pose across the pause still unverified. Check-Status.ps1 unparsable at resume (another session holds uncommitted edits in it): protocol diffs read by hand, Mark-Protocols run with -Force (dirty file not read for this stage)
  - 2026-11-10 replay-audit 1 to 9 (ledger `../.replays/GeniusesCraftFastRenew-20261110.tsv`, Check-Replay OK: 76 rows, 57 done of which 10 weak, 6 open, 13 n/a), stage unchanged: first unfulfilled 9.a (one refused candidate, ticket 0605 queued, scenes 1, 4, 5 and the stat card unwritten). 8.m: `git diff c4b202b HEAD -- Mod` is Mod/About/Preview.png only (revue du diff : images seules), code_review_sha set to HEAD. 6.f fixed in place: TRANSLATION_REVIEW.md generated, FRENCH_REVIEW.md removed. Open, not stage-defining: Tests/Test-Patch.ps1 is CUT (LOCAL-SCRIPTS-REVIEW-2026-11-04: use the shared patch engine; AGENTS.md mission: Rule-OwnValues.ps1 plus generated Test-Mod.ps1, to do once ticket 0605 is read); 07-gallery.feature lacks @requires for camerazoom, colonistrace, screenshotmode, stagedecor (Check-Steps REQUIRES); tested_1_7 not recorded (1.7 diagnostic of 2026-10-13 failed on the fixture, not replayed); 4.g dependency record is one line (`dependencies: none`)
  - done 2026-10-11: _tools/build-preview.cjs, build-about.sh, package.json removed (shared Render-Preview.cjs + Art/Preview.config.json replace them); Tests/Test-Patch.ps1 stays (moved from _tools/ on 2026-10-12: AGENTS.md closing pass 3, no `_` folder at the root) (one consumer, emulates two XML operations offline), row in scripts/LOCAL_SCRIPTS.md awaits validation; art-README.md updated 2026-10-13 (shared renderer), Art migration committed
  - justified not_applicable: UI in French. The mod adds no text, so a French pass shows only vanilla strings; no pass planned (AUDIT.md 8.i, 2026-10-11)
  - 2026-10-13 audit 1 to 8 rechecked: Test-Patch.ps1 PASS both branches, git diff --check clean, About.xml deps unchanged, CHANGELOG [Unreleased], no @wip, Art minimal set, root clean, ModIcon.png 128x128 24.8 KB. 8.m reopened by 968b960 (Mod/ images only, no code): code_review_sha set to 968b960 after reading the diff
  - done 2026-10-13: Preview remounted from the shared renderer (panel bottom-right, echo-preview.png, ModIcon badge bottom-left translated -12.5%/+12.5%), validated by Virginie. `echo_review_sha` not set: the echo review belongs to mountPreview, after the accepted gallery
  - 2026-10-15, gallery ticket e6dc result read (exit 1, 4/6 green): "three crafters" judged and promoted to `Art/Gallery/1-candidate-three-crafters.png` (9.d); "Nelim at her bench" and "the apprentice" judged and rejected (camera framed one cell off the subject at zoom 3, pushing it to the frame edge or out of it entirely; fixed in 07-gallery.feature); the two stat-card scenarios failed on an undefined step (PickleTools/InspectTabs was never staged for this pass: @requires and wsl-deps.sanctuary.map fixed). About.xml description's hardcoded "1.6" removed (owner rule 2026-10-13); STATUS.md trimmed 41 KB -> dated sections in docs/runs/history.md; protocols re-read, protocols_read_sha current. Replay filed on 7fc56bd: ticket `20261015-174457-834-a434`, the 4 fixed scenarios, wsl-deps.sanctuary.map
  - feature: PUBLICATION.md (Steam description block, 1.0.0 change note, gallery order, thank-you drafts) is required before tested -> prepublished; the thank-you register has no row yet for the original, DeCore and Stats Matter
session:      local_496f7725-e589-4d3b-b4d6-4a4cea779979
updated:      2026-11-10, replay-audit: stage unchanged, TRANSLATION_REVIEW.md, code_review_sha at HEAD: shootGallery[1.0.0]
protocols_read_sha: e388fb39a8ecb20dbb4e1e340a0adc33a39659b0
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
