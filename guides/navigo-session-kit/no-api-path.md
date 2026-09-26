# Browser/local-first path

1. Orient: read README, relevant mission and PR lifecycle guidance; check active PRs and claims. Link sources instead of copying Drive content.
2. Select: one bounded task with a stopping condition and explicit non-goals. Ask for a claim where existing conventions call for one.
3. Create: edit locally and push with Git, or use GitHub's browser editor when permitted. If neither is available, hand a patch or complete text to the human; do not claim a commit occurred.
4. Review: inspect the changed files, available checks and discussion in GitHub's browser. Record a receipt. When allowed, open a **draft** PR against the intended base using the GitHub UI; never merge by implication.
5. Respond: Eric's owner-authored PR comments may use the manual cue terms in `owner-cues.md`. A cue means perform the named human-scoped review step, not run every workflow or spend money.
6. Handoff: note completed work, evidence, unresolved decisions and one next footfall; keep the canonical findings in the PR review/discussion surface.

## Optional API-assisted pass

Only after an explicit opt-in: fetch relevant PR state and review receipt, compare evidence to the task's acceptance condition, and propose a concise gap report. Restrict scope to the named PR and phase. Start with a dry run; make no writes or paid model calls without separate permission. Track provider usage separately from GitHub Actions usage. If the provider can automatically switch to paid consumption, configure and verify its own hard stop before enabling the adapter. No API availability must still leave the browser/local path complete.
