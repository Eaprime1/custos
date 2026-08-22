# PR Journey: #309 — Prima Witness CI, review-fix round

**Repository:** Eaprime1/custos
**prima-clock:** 202608220539
**Branch:** `claude/port-prima-witness-ci` → `main`
**Author:** @Eaprime1 (nav1 — Claude + eaprime1)
**State:** MERGED — `2e8d9ed` (2026-08-22T06:53:04Z), finalized/sealed by the `finalize-pr.yml` bot before merge (rubric 20/20, "High")

## Intent

Port hodie's `footer-witness.yml` provenance-scan idea into custos, adapted to
custos's own `Prima-clock:` stamp format and made advisory-only/stateless
(see the PR body for the full adaptation rationale). This journey covers the
second commit on the PR: fixing what reviewers found on the first one.

*Note:* `pr-journeys/202608_PR309_add-prima-witness-ci-provenance-stamp-sc.md`
is the `finalize-pr.yml` bot's own auto-generated record of this same PR
(rubric, CI record, template sections), committed straight to `main` at
seal time. This doc covers the same PR from the other angle — the
reviewer-finding disposition table the bot's summary doesn't include.

## What Arrived — Reviewer Findings and Disposition

Three automated reviewers ran on the initial commit: `codereviewbot-ai[bot]`,
`copilot-pull-request-reviewer[bot]`, and this repo's own `claude-code-review.yml`
(posts as `claude[bot]`). Per eaprime1's direction this session: apply a
reviewer's fix when it's correct and they provided a committable suggestion,
crediting them as co-author; where a reviewer flagged something real but gave
no committable fix, fix it independently and record what happened here instead
of spending Copilot's own repair-commit budget on it.

| Reviewer | Finding | Had a suggestion? | Disposition |
|---|---|---|---|
| `claude[bot]` | `tools/scan_provenance.sh` line 46: `set -o pipefail` made the script abort on any `Prima-clock:` line with no digits, instead of reaching the intended `MALFORMED` branch | Yes — `\|\| true` | **Applied verbatim.** Co-authored-by credited in commit `5eabd7b`. |
| `claude[bot]` | `.github/workflows/prima-witness.yml` line 18: no `continue-on-error: true`, so any non-zero script exit would fail the check and contradict the PR's stated advisory-only intent | Yes — full step diff | **Applied verbatim.** Co-authored-by credited in commit `5eabd7b`. |
| `codereviewbot-ai[bot]` | `date -d` is GNU-specific; fails on macOS/BSD, which `CLAUDE.md` documents as a real local-dev environment for this repo | Yes — `date -j -f` fallback | **Applied verbatim.** Co-authored-by credited in commit `5eabd7b`. |
| `copilot-pull-request-reviewer[bot]` | Same line as the first `claude[bot]` finding, plus a second bug: the unbounded `[0-9]{12}` regex would match the first 12 digits of a *longer* digit run (e.g. a 17-digit hodie-style `∰` stamp pasted in by mistake) as if it were a valid custos stamp | No — prose description only, no `\`\`\`suggestion\`\`\`` block | **Fixed independently**, not via Copilot's own repair flow. Changed the extraction regex to `\b[0-9]{12}\b` (word-boundary anchored), folded into the same line `claude[bot]`'s fix already touched. Verified in an isolated throwaway repo that a 17-digit stamp is now correctly reported `MALFORMED` instead of silently accepted. |

## Verification

All four fixed cases (missing / valid / malformed-no-digits / 17-digit-run /
invalid-calendar-date) re-run against the patched script in a disposable
`git init` scratch repo — see commit `5eabd7b`'s message for the full case
list. All classified correctly; no crash on the malformed case.

## Resonance

*a first, small practice run* — eaprime1 asked to treat `codereviewbot-ai`
as an active contributor where reasonable (apply its real fixes, credit it
by name) while keeping Copilot's own auto-repair out of the loop on cost
grounds. No standing covenant exists for this yet (the earlier
`custos/codereviewbot-covenant-quiet-gate` branch was closed as superseded,
docs never landed on main) — this PR is offered as one concrete instance of
the practice, not a claim that policy is now settled.

## Notes for Next Iteration

- If this pattern is worth keeping, it may be worth writing up as its own
  short doc (not necessarily reviving the old covenant branch) once there
  are a few more instances to generalize from.
- Copilot's finding was real and worth having caught even without a
  ready-made fix — its review is still pulling weight here, just not via
  its own commit.

---
**prima-clock:** 202608220539
**witnessed:** true
*nav1 · review-fix round · nothing here formally closed yet, awaiting eaprime1*
