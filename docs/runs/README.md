# Runs

One line per Pickle run, newest last, never a folder. The raw report stays on disk under
`Tests/Pickle/Evidence/` and out of git; `STATUS.md` cites the line and the evidence folder.

Format: `date | revision | pass | language | filter | exitReason | features found/played | scenarios passed/failed/skipped | verdict | evidence folder`

2026-09-28 | aa5f14b | minimal | English | (none) | passed | 6/3 | 7/2/3 | 2 scenario defects, fixed, not replayed | Tests/Pickle/Evidence/minimal-en-aa5f14b
2026-09-28 | aa5f14b | avec-statsmatter | English | 05-statsmatter | passed | 6/1 | 1/0/0 | green | Tests/Pickle/Evidence/avec-statsmatter-en-aa5f14b
2026-09-28 | aa5f14b | incompat-original | English | 06-original-incompatible | passed | 6/1 | 1/0/0 | green | Tests/Pickle/Evidence/incompat-original-en-aa5f14b
2026-09-28 | aa5f14b | avec-decore | English | 04-decore | passed | 6/1 | 1/0/0 | green | Tests/Pickle/Evidence/avec-decore-en-aa5f14b
2026-09-29 | e4fd722 | minimal | English | (none) | failed | 6/3 | 1/8/3 | Pickle-internal thread error on every colonist spawn, not a mod defect; 01-patch-lands passed | Tests/Pickle/Evidence/minimal-en-e4fd722
2026-09-30 | e4fd722 | minimal | English | (none) | passed | 6/3 | 9/0/3 | green, thread error did not recur (one-off); 3 skipped are the @requires-gated scenarios, correct under minimal filter | Tests/Pickle/Evidence/minimal-en-e4fd722-retry
