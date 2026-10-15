# History

Folded dated sections of `STATUS.md` (AUDIT.md 14.c, applied early for the 40 KB size lint rather than only at
`dormant`), one line per section; the full prose stays in git history (`git log -- STATUS.md`).

2026-09-12 | historical notes | stage `done`: five offline checkers pass; scenario 3 corrected (no Crafting dedup on repeat application); `dependencies: none`, `loadAfter` DeCore/Stats Matter
2026-09-13 | audit before corrections | `done` kept; `Preview générée` gate found a defect (missing source link/badge/suffix in About.xml and Preview), fixed same day; settings and translation `not_applicable` justified
2026-09-13 | presentation corrections | `done` kept; About.xml source link fixed, Preview recomposed (badge, suffix, measured contrast 5.14-11.38:1); SHA-256 of About.xml/Preview.png/patch recorded
2026-09-28 | audit, `done` kept | packageId renamed `nelim.geniusescraftfastrenew` -> `nelim.geniusescraftfast` (private 0.1.0 item already existed); `Tests/Pickle/` written (six features, four passes); `CHANGELOG.md` opens at `0.1.0`
2026-09-28 | first Pickle run | minimal 7/2/3 (two scenario-expectation defects, not mod defects: display-name assertion, mechanoid `WorkSpeedGlobal` expectation); three conditional passes green
2026-09-29 | minimal replay | Pickle-internal "accessing map pawns off main thread" error on every colonist-spawning scenario, not a mod defect; `01-patch-lands` passed, confirming the display-name fix
2026-09-30 | minimal replay | green, 9/0/3, the thread error did not recur (one-off); all four passes jointly green
2026-10-02 | audit, `done` kept | re-searched for an upstream repository (none); evidence trimmed; `tested` criteria table: everything met except the French-pass decision and `PUBLICATION.md`
2026-10-03 | Preview source migration | renderer switched to the shared `Render-Preview.cjs` + `Art/Preview.config.json`
2026-10-11 | audit, `playTests` exit | old `done` remapped to `playTests` under the new fifteen-state `AUDIT.md`; gates 1-8 rechecked: new owner `Preview-source.png` (Vmean 0.464), `FRENCH_REVIEW.md` generated (`not_applicable` stands), `TEST_SCENARIOS.md` (renamed from `TESTING.md`), Pickle suite rerun green; code review of `Mod/` done, `code_review_sha` set
