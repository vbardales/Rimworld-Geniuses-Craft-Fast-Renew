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
licence:      silent
adaptation_licence: MIT, adaptation work only; see LICENSE
licence_at:   three places, the About description among them
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: the nine scenarios in TESTING.md, including DeCore and Stats Matter load-order checks, none played
  - unverified: final in-game logs and English/French stat UI checks
session:      local_ee3236c6-0c0c-4486-8420-7ec19ccd2a13
updated:      2026-09-13, presentation defects corrected and verified; done, in-game validation pending
---

# Geniuses Craft Fast Renew — status

## Presentation corrections and current stage — 2026-09-13

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
