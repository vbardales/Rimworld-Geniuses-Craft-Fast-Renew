# Runs

One line per Pickle run, newest last, never a folder. The raw report stays on disk under
`Tests/Pickle/Evidence/` and out of git; `STATUS.md` cites the line and the evidence folder.

Format: `date | revision | pass | language | filter | exitReason | features found/played | scenarios passed/failed/skipped | verdict | evidence folder`

2026-09-28 | aa5f14b | minimal | English | (none) | passed | 6/3 | 7/2/3 | 2 scenario defects, fixed, not replayed | Tests/Pickle/Evidence/minimal-en-aa5f14b
2026-09-28 | aa5f14b | avec-statsmatter | English | 05-statsmatter | passed | 6/1 | 1/0/0 | green | Tests/Pickle/Evidence/avec-statsmatter-en-aa5f14b
2026-09-28 | aa5f14b | incompat-original | English | 06-original-incompatible | passed | 6/1 | 1/0/0 | green | Tests/Pickle/Evidence/incompat-original-en-aa5f14b
2026-09-28 | aa5f14b | avec-decore | English | 04-decore | passed | 6/1 | 1/0/0 | green | Tests/Pickle/Evidence/avec-decore-en-aa5f14b
