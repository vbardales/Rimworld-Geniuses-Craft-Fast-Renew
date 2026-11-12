# Protocols read, and in which version

Written 2026-09-28 by the geniusescraftfast session, on the owner's request, so that a document that has not moved
is not read again and one that has can be spotted. Version = the last commit that touched the file in the repository
that carries it, and whether it had uncommitted changes when read. The protocol documents live in
`vbardales/Rimworld-protocols`, so `git log` from the monorepo lies about them (`WELCOME.md`, section 5); their
version comes from `git --git-dir=../rimworld-protocols.git --work-tree=. log -1 --format='%h %ad' --date=short -- <file>`.
The short SHA-256 is of the file as read, because several were modified and not committed at that moment.

Read in full unless said otherwise. Re-read a file when its last commit or its hash is no longer the one below.

## Read, and useful

| File | Version read | What this mod's work took from it |
| --- | --- | --- |
| `AGENTS.md` | `3a1d2cb` 2026-09-24, modified not committed, `6cee468a7521` | Evidence rules: keep the latest report per scenario for the current revision, one text line per run in `docs/runs/`, never a folder; publish by CI, dry-run of the exact SHA, only the owner approves `steam-production` |
| `AUDIT.md` | `c5ca0c0` 2026-09-26, modified not committed, `27bb0c0aac43` | The whole chain. What changed my work: "no manual test left" means automated and green or listed not applicable with its reason (step 9); `done` needs Pickle suites written **or their absence justified in writing** (step 12), so this mod's suite and its "not in Gherkin" table; the 0.1.0 prepublication entry in CHANGELOG (step 11); the session title is `<packageId without nelim.> / <stage>`; never launch RimWorld, deposit a request instead |
| `PUBLISHING.md` | `95c6dfd` 2026-09-28, modified not committed, `513f110ae0b6` | **No `renew` in a packageId** (decided 2026-09-27), which is what this mod's packageId change follows; start from the original's repository when it has one, else document why; the one-shot items (description, packageId, `PublishedFileId.txt`); the single-source Steam description in `PUBLICATION.md`; commit `PublishedFileId.txt` at once; the 1.0.0 production steps are the owner's; the `THANKS` and thank-you comment rules; `-unofficial` naming |
| `TRANSLATIONS.md` | `f5c2d9d` 2026-09-25, clean, `298f74d226da` | The l10n gate. The mod adds no text, so the three fields stay `not_applicable`; the plural rule of 2026-09-25 has no number to apply to |
| `MOD_SETTINGS.md` | `b83933b` 2026-09-23, clean, `404916bc99a7` | The settings gate. `settings_audit: not_applicable` stays valid: no page, no shortcut, no option; the fixed curve is the mod's purpose |
| `WORKSHOP_COMMENTS.md` | `5dcb0c7` 2026-09-28, modified not committed, `4ec43a9b47c1` | One recipient page, one main comment for the whole collection, both people of a "(Continued)" page in one message. This mod's recipients are absent from the register: the original (2625574564), DeCore (951016023), Stats Matter (2208346459); Pickle and RimLogging exist and would gain this mod in `Covers` |
| `scripts/SEARCHING.md` | `372c447` 2026-09-23, modified not committed, `013075b06b89` | **Do not hand-roll `grep -r` over the Workshop.** Two of my own background walks broke exactly that rule on 2026-09-28; use `scripts/Search-Workshop.sh`, in the foreground, one at a time |
| `PickleTools/README.md` | `c771bef` 2026-09-25, clean | The tool catalogue. This mod needs none: every step is a stock Pickle step |
| `PickleTools/Authoring/README.md` | `8d3ca6d` 2026-09-26, clean | Not on the owner's list, read because it is the authoring guide. Suite layout, pass matrix, `@requires`, evidence, what to keep. Its "Decide what needs a running game" is the basis of the suite's scope |
| `PickleTools/Headless/README.md` | `ed4e73a` 2026-09-26, clean | **Partly read**: lines 1 to 130 (options, exit codes, filter terms), 195 to 284 (passes, the map's trailing newline, incompatibility passes that assert the symptom), 383 to 509 (what happens to a report, what a staging produces, traps). Not read: 130 to 195 and 284 to 383 (lock, settings seed, no-DLC pass, restart tests) |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `3c03f51` 2026-09-26, clean | Read for the day of publication: dry-run of the exact SHA, `PUBLICATION.md` change notes, the first-publication order. Nothing acted on yet |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` 2026-09-27, clean | One test for a fix, everything for a full pass, one request per pass; a request carries no SHA, so the tree stays frozen until `RUN_DONE`; ignore `desktop.ini` and `*.ico` (done here) |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `d07b2b8` 2026-09-26, clean | Every option of `Submit-PickleRun.ps1`; `-DepMap` is a file name, `-EvidenceDir` is new each time |

## Read, not useful for this mod

| File | Version read | Why |
| --- | --- | --- |
| `STYLE_RIMWORLD.md` | `7311308` 2026-09-25, modified not committed, `2c6db32396ae` | **Headings, then the sections on the `(unofficial)` tag, file constraints and Windows folder icons only.** The Preview and ModIcon were validated by earlier audits and belong to the owner; nothing here asks this session to generate an image |
| `PickleTools/docs/steps.md` | `02e4709` 2026-09-28, clean | Grepped for stat, skill and patched steps only: it lists PickleTools' own steps, and Pickle's stock catalogue is elsewhere. Pickle's own `Docs/steps.md` on GitHub gave the steps this suite uses |

## Not found

| File | Note |
| --- | --- |
| `BACKLOG.md`, `NOTES.md`, `BUGS.md` | This mod has none. No known defect and no missing feature, so none was created |
| `PUBLICATION.md` | This mod has none yet. It is a criterion of `tested -> prepublished`, not of `tested`: the Steam description block, the change note for `1.0.0`, the gallery order and the thank-you drafts |
| `Docs/steps.md` at the repository root | Pickle's catalogue is on GitHub, not on disk |

## This mod's own files

| File | Version | Note |
| --- | --- | --- |
| `STATUS.md`, `TESTING.md`, `CHANGELOG.md`, `README.md` | read and edited on 2026-09-28 | `CHANGELOG.md` now opens with the `0.1.0` entry |
| `ATTRIBUTION.md` (root and `Mod/`) | `60e1749` | Both copies identical, compared with `cmp` |
| `LICENSE` | unchanged | MIT over the adaptation work only |
| `Mod/About/About.xml` | `e4482c1` | packageId without `renew` |
| `docs/runs/`, `Tests/Pickle/` | written 2026-09-28 | No run yet |

## Re-read on 2026-10-02 (audit session)

The tables above are the 2026-09-28 state. Git history of the protocol files is unreliable from here (the monorepo and
the protocols repository disagree), so the version is the SHA-256 prefix of the file as read. A file whose hash equals the
one below is not read again.

| File | Hash read | Read how | Useful for this mod |
| --- | --- | --- | --- |
| `AGENTS.md` | `7a236f03ca15` | in full (also loaded as project instructions) | yes: evidence rule (latest report per scenario for the revision in the repository), `docs/runs/` is lines, trim `history.md` once published |
| `AUDIT.md` | `7c00eb1f3b1b` | in full | yes: steps 9 and 12 (no `@wip`, every conditional scenario run, no manual test; titles of the session); pass ordering (never-run and red first, non-regression last) |
| `PUBLISHING.md` | `30a1c36885ed` | lines 1-150 and the headings, plus greps on CHANGELOG, PublishedFileId, BACKLOG, gallery | yes: PR to the origin repository is mandatory when one exists (none here); gallery folder starts with `0-` = copy of `Preview.png`; no `renew` in a packageId. Not read: the CI section, the mention and licence sections (nothing acted on) |
| `TRANSLATIONS.md` | `e381086a5271` | headings, `not_applicable` definition and plural rule | yes: `not_applicable` needs an inventory that proves no text; the plural rule has no number to apply to |
| `MOD_SETTINGS.md` | `404916bc99a7` | unchanged since 2026-09-28, not re-read | yes, as recorded above |
| `STYLE_RIMWORLD.md` | `5a054cf3a04b` | not re-read | no: images belong to the owner, the audit generates none |
| `WORKSHOP_COMMENTS.md` | `3fb37586f04b` | not re-read (hash changed since 2026-09-28) | not yet: needed for the thank-you drafts of `tested -> prepublished` |
| `scripts/SEARCHING.md` | `013075b06b89` | unchanged, not re-read | no new search this time |
| `PickleTools/README.md`, `Headless/README.md`, `docs/steps.md` | `40e44a5d2c12`, `2310bb974f68`, `6cb87154cdb9` | Headless: grep on evidence only (lines 312-320, 392-394) | the evidence rule only; hashes changed since 2026-09-28, the parts used then are not re-read |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `23fcf6423000` | not re-read | needed on publication day only |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `SUBMIT.md` | `08b440a03f74`, `eaca3969c7eb` | not re-read | needed when a request is deposited; no request this session |
| `PickleTools/Authoring/README.md` | `349e596b4af7` | not re-read | already used to write the suite |

Own files read today: `STATUS.md`, `TESTING.md`, `CHANGELOG.md`, `Tests/Pickle/README.md`, `docs/runs/README.md`. Absent for
this mod, still correct: `BACKLOG.md` (no origin repository, so no pull request to track), `NOTES.md`, `BUGS.md`,
`PUBLICATION.md` (criterion of `tested -> prepublished`).
