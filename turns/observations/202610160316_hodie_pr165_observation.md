# Observation — PR #165 (hodie)

Template prima-clock: 202610070835

Prima-clock: 202610160316
status: complete
pr: #165 (Eaprime1/hodie, `feature/peer-swap-hodie-side-b` into `main`)
head: `d3fe02e` (observed from `138e80e`, the sealed head)
observer: Navigo Claude (oversight) with the Shepherd

Filed in custos, as the peer-swap README says, so the record of both PRs sits together. `status:` stays `open` until the Shepherd has read this and given the re-seal. Rubric: `RUBRIC.md` (v0, first use). Not seen: hodie's own clone beyond what is named; `pytest` was not run by oversight (the module is not installed here).

## Order note

Sealed at 202610160212 (the first `@claude finalize` at 02:06 was refused for three gaps in the PR body, then passed). The seal came before this review. The fixes below reopened it; the Shepherd seals again on the new head.

## Seen

- Checks on `d3fe02e`: 12 of 12 green (Codacy 0 new issues, three build matrix entries, witness check, expression-injection check, GitGuardian), on both the pull request and push runs.
- Review threads: none open.
- Merge state: clean. `main` has moved one commit (a journey document written when the PR was sealed) and the PR still merges cleanly.
- Bots: Codacy 0 new issues; the daily-ledger bot posted its entry; the finalize rubric scored 17/20 "Medium" (scope 3 of 5, 26 files).
- Paid review: ran green at `3784501` and skipped at `6778023`; it has not seen the workflow gate changes or the later heads. No visible comment.
- Workflow files: every file in `.github/workflows/` parses; the embedded scripts of `auto-finalize.yml` and `finalize-pr.yml` pass `node --check`. The gate logic of `AUTO_COMMITS` is by reading, not by running.
- Frozen files against their freeze commits: Pass 3 identical; Pass 1 and Pass 2 differ only by the witness line appended at the Shepherd's word (`431f116`); session A files differ from `d494054` only by an appended witness line each (`6778023`).
- Claims checked: 15 domains in `quanta/`, 29 scripts in `.scripts/`, 17 carriers in `moav/`, `claude.yml` deleted, the four Gemini files carry `.yml.disabled`.
- Privacy: no emails, folder IDs, tokens or phone numbers in any added line.
- Seal gate: found open. It sealed on any owner, member or collaborator comment containing `@claude finalize`, including one that carried the Claude Code footer or quoted the cue.

## Fixed during the review

- Seal gate now skips a comment with either footer wording and ignores cues in code and quotes (`d3fe02e`, ported from custos). `scripts/test_finalize_gate.sh`: 11 of 11 pass; 4 of 11 on the old gate.
- Session A README said "unchanged"; it now says what changed (`d3fe02e`).
- `first-run-notes.md` and `CHANGELOG.md` record the gate change (`d3fe02e`).
- PR body: the Resonance note named the Shepherd by personal name; it now says "Shepherd". "How I checked" and "Left open" rewritten to match the head.

## Carried forward

- `AUTO_COMMITS` gates have not run on GitHub. Owner: the Shepherd. Plan: the choice is to keep auto-commits off. If any are turned on, each needs a cause that cannot re-fire itself: a default-branch-only filter, `[skip ci]`, and a skip when the actor is the bot. The witness refresh already has the first two. A live test after merge: set the variable on, push to a scratch branch and confirm nothing commits, push to `main` and confirm one commit, then set it off.
- `scripts/test_finalize_gate.sh` is not wired into CI. Owner: hodie conversation. It needs PyYAML.
- The gate still lets `github-actions[bot]` comments through. A bot comment cannot start a new run, so it has not mattered; revisit if that changes.
- `LICENSE`, issue templates, `wellspring/` triage, `branch-tracker/branches.md` refresh: the Shepherd's.
- Gemini workflows: read the old failed run's error, fix, re-enable (steps in `.gemini/OUT_OF_ORDER.md`).
- The two bot commits `4e2c96e` and `5bc876e` stay Unverified; a merge commit keeps them in history. Owner: the Shepherd, accepted as the cost of keeping the freeze commits.
- Hodie's custody entry and carrier: after the merge (see the PR #450 observation).
- The approve-and-run step: the Shepherd sees it in custos after the seal cues; hodie has no equivalent. Looked at after the workflow names are known.

## Scores (RUBRIC.md v0)

| # | Score | Count behind it |
|---|---|---|
| M1 Checkable | 2 | 9 claims or items checked, all held; pytest result (88) not re-run |
| M2 Independent | 2 | authors report convergent findings (registry row, empty Spade, bounty remnant, pytest-asyncio); not verified from commits |
| M3 Scope held | 0 | 16 of 28 files outside the swap and its records (57%); all at the Shepherd's word, which does not change the load on review |
| M4 Live proof | 2 | 5 behaviour changes; 3 seen live (Gemini pause, no bot commits on the branch, template accepted by the gate); AUTO_COMMITS and the new gate offline only |
| M5 Seal order | 1 | sealed before oversight; recorded above; 0 commits after the seal except oversight's |
| M6 Repair rate | 0 | Form E item 3 named 8 follow-ups; 3 done (plexus wording, `COMPLETE` wording, seal-gate guard) |
| M7 Drift | 2 | tool run on both repos, 0 unexplained (6 of 25 flagged: a deleted file, a renamed file, four branch prefixes); paths only |
| M8 Surprise | 2 | Pass 2 lists C-1 to C-4 |

## Scans

- `bash tools/scan_lexeme.sh` is custos's; hodie's own scan is the strict witness check, green on the head.
- Privacy scan: no private details or real-place names in added lines.
- Witness lines on new `.md` files: yes (checked by CI).

## Ready for the seal

- [ ] Every item above is done or carried forward with a reason
- [ ] No outstanding requested changes
- [ ] Description filled in: Intent, What Arrived, Resonance, What changed, How I checked, Left open
- [ ] Checks re-read green on the final head

## Result

Observed. Nothing blocks the merge; one real gap (the seal gate) was found and fixed, which reopened the seal. Ready for the Shepherd to read, then seal.

## Closing note — 202610160448 (UTC)

Added after the merge; the sections above are unchanged. `status:` is now `complete`.

- Merged by merge commit `a2b6a3f`, so the freeze commits stay in history.
- Done since this was written: the "approve and run" step was looked at (bot-authored commits do not start workflows, so GitHub holds them for the owner; the journey commit after each seal is the case) and the new `final-oversight` gate was built for it (#452); hodie's custody entry is filed (#453, registry row `202610160105`, carrier `moav/hodie_moav_entry_peerswap001.json`).
- Still carried forward: footer wording in four copies, the footer guard and `AUTO_COMMITS` live tests, the meaning of ♠️ on a carrier, optional transfer fields in `moav/README.md`, the second swap. Owners are as listed above.
