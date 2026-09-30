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
stage:        done
workflow_stage: done
licence:      silent
adaptation_licence: MIT, adaptation work only; see LICENSE
licence_at:   three places, the About description among them
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:
workshop:     3806761999 (private item created by the 0.1.0 upload of 2026-09-23; PublishedFileId.txt committed in 1692def)
remaining:
  - unverified: French UI is not exercised by this suite; the mod adds no text, so localization stays not_applicable, but no French pass was run either
  - feature: PUBLICATION.md (Steam description block, 1.0.0 change note, gallery order, thank-you drafts) is required before tested -> prepublished; the thank-you register has no row yet for the original, DeCore and Stats Matter
session:      local_ee3236c6-0c0c-4486-8420-7ec19ccd2a13
updated:      2026-09-30, minimal pass replay green (9/0/3), all four passes jointly pass
---

# Geniuses Craft Fast Renew — status

## Audit 2026-09-28 — done kept

**Previous stage `done` -> retained `done`** (`workflow_stage: done`; `stage` codes: `showcase` covers Preview
générée to l10n, `preTest`, `done`, `tested`, `published`). No gate failed, so nothing moves down.

Audited revision: `60e1749`, standalone repository, `origin/main` in step. Working tree at the time: `TESTING.md`
modified, `Tests/` and `docs/` untracked (written in this session), nothing else. Protocols read and their versions:
`docs/PROTOCOLS-READ.md`.

| Transition | Result and evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated. Own `.git`, one remote, public repository, `STATUS.md`, English documentation. packageId `nelim.geniusescraftfast` without `renew` (changed today, see below), folder and repository keep it. Licence `silent`, `(unofficial)` suffix and `UNOFFICIAL` opening paragraph present. **No upstream repository exists** for the original: Steam page and `About.xml` link to none, a GitHub search finds only this adaptation; recorded in `ATTRIBUTION.md`, so there is nothing to base on or send pull requests to |
| horsMonoRepo -> ModIcon générée | Validated, unchanged: `Mod/About/ModIcon.png` 128 x 128, 19,588 bytes. Not judged again, not generated; the owner alone generates icons |
| ModIcon générée -> Preview générée | Validated, unchanged: `Mod/About/Preview.png` 896 x 504, 491,195 bytes, SHA-256 identical to the 2026-09-13 record |
| Preview générée -> preOptions | Validated. Description in English, opens with the `UNOFFICIAL` paragraph, ends with `[url=...]Source code on GitHub[/url]` on the repository of `<url>` and `origin`. The 2026-09-13 correction still holds |
| preOptions -> options | `settings_audit: not_applicable`, still valid against `MOD_SETTINGS.md` of `b83933b`: no page, no shortcut, no option, and the fixed curve is the mod's purpose |
| options -> l10n | `not_applicable` for the three fields, still valid against `TRANSLATIONS.md` of `f5c2d9d`: the mod adds no text and no number reaches a key, so the plural rule of 2026-09-25 has nothing to apply to |
| l10n -> preTest | Cited from the audit of 2026-09-13 (below), still true: only vanilla operations and classes, no mandatory dependency, `loadAfter` names Core, the five DLCs and the optional DeCore and Stats Matter. Nothing in `About.xml` changed but the packageId |
| preTest -> done | **Validated.** Automated and XML tests rerun today, green (list below). The Pickle suite is now **written**, and what stays out of Gherkin is justified in `Tests/Pickle/README.md`. The earlier state had no `Tests/Pickle/` and no sentence saying why, which `AUDIT.md` step 12 does not accept; this session wrote it, so `done` is kept rather than lost |
| done -> tested | Not verified, nothing run in game. Requirements for this mod are in `TESTING.md`, "What `tested` requires" |

### Controls run on 2026-09-28, RimWorld 1.6.4871

- `_tools/Test-Patch.ps1`: both conditional branches pass, existing list preserved, curve, repeated application.
- `Check-XmlFields`: 2 files, no unknown field. `Check-XmlClasses`: 3 references, all resolve. `Check-TypeRefs`: no
  unguarded third-party type. `Check-DefRefs`: well-formed, no unresolved reference or parent.
  `Check-ConfigErrors`: 0 of 0 defs, which proves nothing about the patch. `git diff --check`: clean.
- `About.xml` parses; description opening and closing lines checked as text.
- Both `ATTRIBUTION.md` copies identical (`cmp`). `Mod/` holds no `.dds`, no `.ico`, no `Preview.ico`; no `.dds` is
  tracked in the repository.
- Not run, and not claimed: any in-game scenario, any `Player.log`, any Pickle request.

### Changes made in this session

- packageId `nelim.geniusescraftfastrenew` -> `nelim.geniusescraftfast`, at the owner's word, after the private `0.1.0`
  item existed. Safe because that item was never public and no save names the old id. `ModsConfig.xml` no longer lists
  this mod at all.
- `CHANGELOG.md` opens with `## [0.1.0]`, the creation of the Workshop item, and `PublishedFileId.txt` is committed
  (`1692def`). The upload was `Mod/` exactly as at `5a243fc`, which differs from now only by the packageId.
- `.gitignore`: `*.dds`, `Tests/Pickle/Evidence/`, `evidence/`, `desktop.ini`, `Art/*.ico`, `Thumbs.db`. Nothing was
  tracked under those names.
- `ATTRIBUTION.md` (both copies): no source repository for the original.
- `Tests/Pickle/` (six features, four passes, stock steps, no local C#), `docs/runs/README.md`, `docs/PROTOCOLS-READ.md`,
  and the mapping of the nine scenarios in `TESTING.md`.

### Findings, none of them a defect

- **A mod that inherits from the stat.** De-generalize Work (`Alias.DegeneralizeWork`, 2011655761, 1.6) gives
  `GeneralLaborSpeed` a `Name` attribute and defines three stats with `ParentName="GeneralLaborSpeed"` that declare no
  `skillNeedFactors` of their own. Patches run before inheritance, so those three stats would inherit this mod's Crafting
  entry. Read from the files; **not tested and not in the suite**. It needs Vanilla Skills Expanded, and neither mod is
  active now. Worth a pass only if the owner runs both.
- The 2026-09-12 corpus search found 13 candidates and two that add a Crafting factor (DeCore, Stats Matter). Redone
  on 2026-09-28 with `scripts/Search-Workshop.sh` (two earlier hand-rolled walks of mine were stopped, see
  `docs/PROTOCOLS-READ.md`): 6,163 XML files mention the stat, and 8 of them also mention `skillNeedFactors`. They are
  this mod (its own Workshop item and the junction), Stats Matter, the original, and four already in
  `_tools/compatibility-candidates.txt` that write no factor (a redefinition of the stat in `2594241153`, the source
  tree of `2866414675`, `3751288694`'s redirect of recipes). No new mod writes a Crafting factor. DeCore is not
  installed, so it was not part of this search.
- `Mod/desktop.ini` exists on disk, hidden, ignored by git. Steam sends `Mod/` as it stands when the upload is made
  from the game, but the CI ships the tracked files only. Nothing to do while publication goes by CI.

## First Pickle run, 2026-09-28

Four requests, deposited against `aa5f14b`, all read. See `docs/runs/README.md` for the one-line log and
`Tests/Pickle/Evidence/` for the reports kept.

| Pass | Result | Note |
|---|---|---|
| minimal | 7 passed, 2 failed, 3 skipped of 12 discovered | The two failures are scenario defects, not mod defects (below). The three "skipped" scenarios (`04`, `05`, `06`, gated by `@requires`) did run and pass in their own passes; this report's own "skipped" count is right for what ran under it |
| avec-statsmatter | 1/1 passed | Two entries confirmed, product 6.095 at crafting 10 |
| incompat-original | 1/1 passed | The original loaded with a version-mismatch warning, not dropped: `Player.log` lists `Buitrago.GeniusesCraftFast (incompatible version)` among the active mods, not among any dropped list. Two entries confirmed, product 28.09 |
| avec-decore | 1/1 passed | `Daniledman.DeCore` loaded with no warning, confirmed in `Player.log`. Two entries, product 6.89 |

**`01-patch-lands` failed**: `def "GeneralLaborSpeed" was patched by mod "nelim.geniusescraftfast"` does not match, because
that step compares the mod's **display name**, not its packageId (confirmed by the failure message, which named
`Geniuses Craft Fast Renew (unofficial)`). The patch itself landed correctly; only the assertion's string was wrong.
Fixed in the feature file the same day.

**`03-mechanoid` failed**: expected `GeneralLaborSpeed` at 1 on a constructoid, actual 0.5. Vanilla gives every
mechanoid a `WorkSpeedGlobal` penalty with no Mechanitor work precept (`Biotech/Defs/HediffDefs/Hediffs_Mechanitor.xml`);
`noSkillFactor` (1) is not the same number as the finished stat, which was the wrong reading in the original
scenario. The stat card carried no Crafting line in that run, which is the actual point of the scenario. Fixed the
expected value to 0.5, with the reasoning in the feature file.

Neither failure is a defect of the mod: both are corrected in `Tests/Pickle/Mod/Pickle/Features/`, not yet replayed.

## Minimal pass replay, 2026-09-29 — Pickle-internal failure, not a mod defect

Replayed on `e4fd722` (the two fixes above). Result: 1 passed, 8 failed, 3 skipped of 12.

`01-patch-lands` passed, confirming the display-name fix. Every other scenario that spawns a colonist —
all seven of `02-curve` and `03-mechanoid` — failed on the same error, logged by Pickle itself and not by this
mod's patch: `Accessing map pawns off main thread - this is never allowed due to list pooling and will result in
modification exceptions elsewhere in code.` (`RimWorks.Pickle.Runtime.SuiteRunner:87`, seven occurrences,
`Tests/Pickle/Evidence/minimal-en-e4fd722/Player.log`). `exitReason: failed`, a completed run, not a partial one.
`04-decore`, `05-statsmatter` and `06-original-incompatible` were skipped in this pass (as designed, `@requires`)
and untouched by this failure; their 2026-09-28 green stands.

Read against `AUDIT.md`'s environment causes: this is not one of the four already documented there (Prepatcher,
covered window, Concord/Harmony bridge, sleeping machine), so it is a fifth, distinct from a defect of this mod's
patch — the stack trace is entirely inside Pickle's own runner, nothing in it names `GeneralLaborSpeed` or this
packageId. Filed a bare replay of the same pass on the same revision to see whether it recurs; not fixed by any
change here, since there is nothing in this mod's scenarios to change.

## Minimal pass replay, 2026-09-30 — green, one-off confirmed

Same revision `e4fd722`, same minimal pass, no code change. Result: 9 passed, 0 failed, 3 skipped of 12.
The thread error did not recur. The three skipped scenarios are the `@requires`-gated ones (`04`, `05`, `06`),
correctly skipped under the minimal filter, not affected. All four passes (minimal, avec-statsmatter,
incompat-original, avec-decore) are now jointly green. Evidence: `Tests/Pickle/Evidence/minimal-en-e4fd722-retry`.
`done -> tested` per `TESTING.md`'s "What `tested` requires" now has its automated-suite leg satisfied; remaining
gaps before `tested` are the in-game French/English stat-card read and the PUBLICATION.md items listed above.

## Presentation corrections and current stage — 2026-09-13

**Replaced on 2026-09-28 by the audit above; kept as history.**


`Preview générée` -> `done`: the presentation gate now passes. Settings, localization,
dependency and offline-test validations from the audit below remain applicable; none of
their functional inputs changed. `done` means ready for final in-game validation, not
`tested`. Both are literal workflow states, with no separate numeric mapping.

Base revision remains `2e51a70758d3be632b4605854d9eeb5ed360700e`, with the previously
recorded local changes preserved. This correction changes About.xml's final source link,
the shipped Preview, editable art/build files and this status. The gameplay patch, ModIcon,
original illustration, package ID, dependencies, settings and runtime text are unchanged.
No commit, push or Workshop publication was performed.

- About.xml now ends its description with exactly
  `[url=https://github.com/vbardales/Rimworld-Geniuses-Craft-Fast-Renew]Source code on GitHub[/url]`,
  after the credits and adoption clause. The redundant raw repository URL was removed.
  XML parsing and an exact suffix/target check against `<url>` and `origin` passed.
- `Art/preview.html` replaces the old `_tools/preview.html` composition and consumes the
  single palette in `Art/preview-palette.json` through `_tools/build-preview.cjs`.
  The preserved wood-floor illustration supplies the muted brown veil; dominant golden
  wood/fabric supplies the secondary ink; the red fabric stack supplies the distinct red
  accent. Final colour values are recorded only in the palette JSON.
- Title: 46 px / weight 600, Renew at 65% in secondary ink; `(unofficial)` is a separate
  24 px / weight 400 line. Title and summary share the main ink; rule and badge share
  the red accent. No linking words need a separate treatment. Text starts at (50, 54).
- The 80 px corner badge displays 1.6, read from the highest supported version in the
  actual About.xml. Its 26 px bold text is centred at (869, 27), rotated 45 degrees.
- The renderer waited for `document.fonts.ready`; Chrome's platform-font inspection
  confirmed Segoe UI/Semibold/Bold, with no fallback. It reads the original illustration,
  rasterizes the HTML overlay and losslessly compresses the output. No illustration was
  generated or repainted. `_tools/build-about.sh` now invokes this renderer for the Preview.
- Final shipped PNG: **896 x 504, 491,195 bytes**, below 1 MB. Direct inspection of the
  final image and `Art/QA/preview-268.png` confirmed readable title/version, distinct
  suffix/tag and accent, visible rule, no cropped badge or overlapping text, and the
  retained high overhead workshop scene. The summary is intended for full-size reading.
- Background-only rendering was measured at every pixel under the text line rectangles.
  Minimum contrast: title **11.38:1**, Renew/tag **7.25:1**, summary **5.39:1**,
  badge **5.14:1**; all exceed 4.5:1. Earlier attempts with insufficient summary/badge
  contrast were rejected before replacing the shipped image. Geometry, fonts, size and
  precise measurements are in `Art/QA/preview-checks.json`; the sampled background is
  `Art/QA/preview-background.png`.
- `_tools/Test-Patch.ps1` was rerun successfully on the installed vanilla data: both
  branches, preserved Artistic entry, seven curve values and documented repeat behavior
  pass. `git diff --check` passed. The previous XML class/reference/dependency checks remain
  valid because the only XML change is descriptive metadata; About.xml parsing was rerun.

Final SHA-256:

- `Mod/About/About.xml`: `3895A6819CFACD1B412B8C98CA8BF451F1C882EB376916C1DD6792E8F880CBC8`
- `Mod/About/Preview.png`: `DBEE31C1AADEDFF5761B5447AE6172F1CC6FF37E0EE74A7330265F6FC31D1589`
- `Mod/Patches/GeneralLaborSpeed.xml`: `19752EBE12246D2488784A19AD7372F9962FCF53811023917C2C2D44E5844925` (unchanged)

Next transition, `done` -> `tested`: execute the nine TESTING.md scenarios in RimWorld,
inspect the logs and English/French stat UI, and record actual save and optional compatibility
results. No in-game session was run by this correction. Missing runtime verification remains
`unverified`, not a demonstrated defect. The optional recommendation about qualifying save-safety
claims remains distinct from the resolved presentation blockers.

## Audit before corrections — 2026-09-13

This section records the audit before the presentation corrections above; it and the older
notes are preserved as historical evidence. Previous stage: `done`. Stage at that audit:
`Preview générée`, literally the third state in the supplied workflow (no numeric code).
Later independent checks below do not bypass the first failed cumulative gate.

Scope: standalone repository `C:/Users/nelim/Documents/rimworld/GeniusesCraftFastRenew`,
distributed folder `Mod/`. Audited HEAD: `2e51a70758d3be632b4605854d9eeb5ed360700e`.
At entry, About.xml, README.md, STATUS.md and TESTING.md had uncommitted changes;
`_tools/Test-Patch.ps1` was untracked. The audit tested those working-tree files,
not merely HEAD, preserved them, and changed only this status document.
Rules read: parent PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md,
TRANSLATIONS.md and AGENTS.md; the supplied audit prompt overrides conflicting rules.

### Ordered gates

| Transition | Result and evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated. `git rev-parse --show-toplevel` identifies this standalone root. Remote origin matches About.xml and the documented repository. Live `git ls-remote origin HEAD refs/heads/main` returns the audited HEAD for both; `gh repo view ... --json visibility,name,url` confirms PUBLIC. Initial sandbox network/config access failed; the read-only retry outside that restriction succeeded. |
| horsMonoRepo -> ModIcon générée | Validated. Entire implementation is one finished XML patch with no C# project, assembly or compilation step; build is justified not applicable. Patch regression tests pass. Shipped ModIcon is PNG, 128 x 128, 19,588 bytes; directly inspected mascot, gear/wrench and speed motif. |
| ModIcon générée -> Preview générée | Validated. Directly decoded and inspected shipped PNG, 896 x 504, 601,056 bytes, below 1 MB. Workshop scene, high overhead oblique camera, tiled floor, one faceless worker, warm work light and restrained colour families. No concrete camera defect or unresolved camera doubt. No historical generation report required. |
| Preview générée -> preOptions | Defect. About description is English and its repository URL is correct, but the final text is the adoption clause, not the mandatory `[url=https://github.com/vbardales/Rimworld-Geniuses-Craft-Fast-Renew]Source code on GitHub[/url]`. Preview shows Renew at full title size in the same ink; the required secondary-colour 65% suffix, `(unofficial)` tag and supported-version 1.6 badge are absent. There is no distinct secondary ink to validate against the accent. Confirmed on the PNG and `_tools/preview.html`. Metadata/README/STATUS naming and unofficial disclaimer themselves are consistent. No linking words in this title need reduction. |
| preOptions -> options | Independent check: justified not applicable; see Settings audit. |
| options -> l10n | Independent check: justified not applicable for all three translation fields; see Translation audit. |
| l10n -> preTest | Independent check validated. Only vanilla PatchOperationConditional, PatchOperationAdd, SkillNeed_BaseBonus, Crafting and GeneralLaborSpeed are used. No mandatory framework/DLC, LoadFolders or third-party conditional patch. Original package is excluded. Installed DeCore and Stats Matter About files confirm the declared optional package IDs and 1.6 support; their actual XML additions/replacement explain loadAfter. They are not required dependencies. No in-game integration is certified. |
| preTest -> done | Independent offline checks pass; nine functional scenarios are written with actions and expected readings, using the common setup and existing-save prerequisites in TESTING.md. The real shipped patch was exercised; see commands and limits below. Cumulative stage remains blocked at presentation. |
| done -> tested | Not verified. No game was launched, no scenario executed, no Player.log or live English/French UI checked in this audit. Existing-save add/remove is planned in scenario 9. A separate new-colony creation test is not necessary for this stat-only patch: no world generation, new-game hook or persistent mod data. Existing-save scenarios still require actual execution. |

Repository/legal packaging: packageId `nelim.geniusescraftfast`, folder
`GeniusesCraftFastRenew`, repository `Rimworld-Geniuses-Craft-Fast-Renew`, and display name
are semantically consistent. English README, ATTRIBUTION, LICENSE, CHANGELOG and TESTING
exist. Root and shipped LICENSE/ATTRIBUTION copies match by SHA-256. The installed original
Workshop item 2625574564 declares only 1.3 and contains no licence file or permission in
its About description, supporting the recorded `silent` classification under the workflow.
The existing public/silent decision, attribution and takedown commitment are preserved;
MIT explicitly covers only adaptation work. This is not a grant of upstream permission.
Live Steam comments/permission changes were not rechecked; the existing rights record
and inspected source are the basis of this audit, not a new claim of consent.

### Settings audit

`settings_audit: not_applicable`. Inventory includes the two XML values and README's
Retuning section, not just the absence of C#. The mod's explicit purpose is to preserve
Buitrago's fixed curve, including its low-skill penalty. `baseValue=0.30` and
`bonusPerLevel=0.50` define that preset, rather than an advertised configurable gameplay
feature. Retuning documents a source modification in both branches; it is not an existing
user setting or persistence contract. Making this a configurable balance framework would
expand scope. No empty ModSettings page, MainButtonDef, shortcut, UI code, settings store
or inherited settings exist anywhere in the shipped inventory. No relevant access,
input validation or persistence tests apply. Neither RIMMSQOL nor another customization
integration was tested or is claimed supported. The supplied prompt permits this source
verification without an in-game run for the no-settings case.

### Translation audit

`localization`, `translation_en`, `translation_fr`: justified `not_applicable`.
Complete shipped inventory: two XML files, two PNGs, LICENSE and ATTRIBUTION. The patch
only adds numeric skill factors and references vanilla Crafting/GeneralLaborSpeed; it
adds/replaces no label, description, message, translation key or grammar fragment. No
owned runtime text, interpolation parameter or DefInjected path requires EN/FR resources.
No language folders or redundant English files are needed. About metadata, image text and
repository documentation are excluded by TRANSLATIONS.md. Check-DefInjected is therefore
not applicable. Vanilla stat-card rendering in EN/FR remains an unexecuted final game
check; no native localization regression is certified by this inventory.

**Re-checked 2026-09-30**, on request, after a sweep found a mislabelled French folder in another
mod. `find` over the whole repository, any depth and case, for `Languages`, `Keyed`,
`DefInjected`, `Strings`, `French`, `Français`, `grammar`: nothing. The one patch file was reread
in full: it names two vanilla identifiers (`GeneralLaborSpeed`, `Crafting`) as field values, and
adds no `<label>`, `<description>` or other string field of its own. The verdict is unchanged.

### Executed checks and reproducible evidence

Game data: installed RimWorld `1.6.4871 rev590`, standard Steam installation.
All commands below completed with exit code 0 against the current working tree:

- `& .\_tools\Test-Patch.ps1`: both conditional branches pass; one existing list is
  preserved, neutral Artistic entry unchanged, seven curve values correct, repeated
  application yields one list and two Crafting entries as documented.
- `& ..\scripts\Check-XmlFields.ps1 -ModPath .\Mod`: 2 files, no unknown fields.
- `& ..\scripts\Check-XmlClasses.ps1 -ModPath .\Mod -TypeLists ..\rw16_types.txt`:
  all 3 referenced types resolve in the supplied 1.6 type inventory.
- `& ..\scripts\Check-TypeRefs.ps1 -ModPath .\Mod`: 2 XML files, no unguarded
  third-party type reference.
- `& ..\scripts\Check-DefRefs.ps1 -ModPath .\Mod`: well-formed XML, no unresolved
  or wrongly typed Def references or parents.
- `& ..\scripts\Check-ConfigErrors.ps1 -ModPath .\Mod`: 0 of 0 Defs; justified
  zero coverage, not proof of patch runtime correctness.
- `git diff --check`: no whitespace errors; LF/CRLF notices only.
- PNG decoding with System.Drawing confirmed dimensions/PNG format; direct visual
  inspection used the actual distributed images, not only their source HTML.

The regression harness emulates two XML operations; it does not execute RimWorld's
loader, skill clamp, stat cache, jobs, saves or UI. Compatibility XML was inspected this
audit; the historical two-order emulation results are preserved, not presented as newly
executed or as game tests. Duplicate application is a documented limitation, not a new
failure of the single-application contract.

SHA-256 of audited functional files:

- `Mod/About/About.xml`: `2909892292502B487731DA43EC992497B7A1FCE5C325CB89E4662457FD3A3361`
- `Mod/Patches/GeneralLaborSpeed.xml`: `19752EBE12246D2488784A19AD7372F9962FCF53811023917C2C2D44E5844925`
- `_tools/Test-Patch.ps1`: `E5A970EA24103E00779A66A62191F8A05C6E6913D15D347A14B2632A13BB9671`

Next transition only: correct the final About link and recompose the existing Preview's
suffix/tag/badge and secondary/accent hierarchy, then inspect the result at full and
thumbnail sizes and recheck metadata XML. Use the prescribed Art palette/HTML structure
when recomposing; currently `_tools/preview.html` is the only composition file and no
`Art/preview-palette.json` exists. No new illustration or functionality is required.
Missing historical contrast measurements or camera-comparison records are not additional
blockers. Optional recommendation: qualify README/About save-safety assertions until
scenario 9 has actually passed. No runtime defect is inferred from that missing test.

## Historical notes — preserved

Audit on 2026-09-12:

- Title: `Geniuses Craft Fast Renew (unofficial)` in About.xml. The existing suffix identifies
  the unofficial continuation; no further suffix is needed.
- Manual functional tests: nine scenarios in `TESTING.md`, written but not yet played.
- Automated tests: `_tools/Test-Patch.ps1` is now kept in the repository and passes against
  the installed vanilla XML. It checks both branches, preservation of an existing skill entry,
  the seven curve values and repeated application. It emulates the XML operations only.
- Shared XML checks rerun successfully: `Check-XmlFields`, `Check-XmlClasses`, `Check-TypeRefs`,
  `Check-DefRefs`, `Check-ConfigErrors`. The last reports zero defs to inspect; a pass there
  does not validate the patch. The dedicated regression script supplies the patch coverage.
- GitHub: the repository URL is present both in About.xml's `url` and in its description.
- Licence: `licence: silent` describes the original Buitrago mod's undeclared licence.
  The adaptation's own work is under **MIT**, copyright 2026 Nelim, as scoped by `LICENSE` and
  the identical shipped `Mod/LICENSE`. This does not relicense the original author's work.

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
  `TESTING.md` says what the first run has to settle, and the log settles almost none of it: one
  patch operation and no def of its own, so a patch that lands writes nothing and a patch that
  lands twice writes nothing either. The reading that decides is the skill factor line on a
  colonist's stat card.
- **Scenario 3 corrected on 2026-09-12:** the conditional preserves an existing
  `skillNeedFactors` list but does not deduplicate Crafting entries. An offline application of
  the actual patch XML, with and without a pre-existing neutral Artistic entry, preserves one
  list and adds one Crafting entry per application. Applying it twice leaves two Crafting
  entries. The game's `StatWorker` multiplies their factors, as checked in the 1.6 assembly.
  This documents the current behavior; it does not count as a completed in-game scenario.
  The installed Workshop search also completed: 9,108 XML/C# files mention this stat, and 13
  also mention skill needs. Inspection found two overlapping mods besides the excluded
  original: DeCore 1.6 adds a list unconditionally; Stats Matter(continued) creates or replaces
  it. Scenario 3 records the expected results in both load orders. These remain in-game tests
  to perform, and DLL-only changes were not audited.
  `Mod/About/About.xml` now declares `Daniledman.DeCore` and `StatsMatter.velcroboy333` in
  `loadAfter` and explains the remaining multiplication of factors in its player-facing
  description. Both load orders were checked offline using the actual XML operations; the
  updated About parses successfully and `git diff --check` passes.
- **`dependencies: none`** — literal here. XML only, no assembly, no framework, no DLC
  requirement. The About's `loadAfter` also names the optional DeCore and Stats Matter mods:
  Renew must follow them to preserve its entry in a single list. Their factors still multiply
  with Renew's, as the About description explains. These are ordering rules, not dependencies. The
  value means the mod needs nothing, as against `declared` when every mod it needs is named in
  the About's `modDependencies`, and `to check` when a non-vanilla `loadAfter` suggests one that
  is not. An undeclared dependency is not cosmetic: on 2026-09-11 Reequilibrage animaux took 47
  vanilla animals down with it, Muffalo included, because the class it injects belongs to a mod
  that was not declared and not loaded.
- **`remaining`** — one entry, `unverified`, for the reason above. There is no known defect and
  no missing feature.

`detached: yes` since 2026-09-12: this folder is its own git repository, on `main`, with one
remote pointing at the public repository above. The monorepo ignores it and tracks none of its
files. The `packageId` is `nelim.geniusescraftfast`, without the `Renew` suffix: it gained it on
2026-09-12 and lost it on 2026-09-28, at Virginie's decision, after the Workshop item had been
pre-published (`Mod/About/PublishedFileId.txt`). The folder, repository and display name keep
their `Renew`. No other mod of hers names either identifier.

`licence: silent` — the source declares none. GeniusesCraftFast ships no `LICENSE` file and its
Steam description says nothing about reuse, and it has been abandoned since 11 October 2021, page
still online, no continuation on the Workshop. `licence_at` counts where that is written down:
`ATTRIBUTION.md`'s Licence section, the README's Credit paragraph, and the mod's own description,
which is the one Buitrago would ever see. `<incompatibleWith>` names `Buitrago.GeniusesCraftFast`
and does not move — it is the original's identifier, not this adaptation's.

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
