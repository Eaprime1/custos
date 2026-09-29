# Browser/local-first path

1. Orient: read README, relevant mission and [`PR lifecycle`](../pr-lifecycle.md) guidance; check active PRs and claims. Link sources instead of copying Drive content.
2. Select: one bounded task with a stopping condition and explicit non-goals. Ask for a claim where existing conventions call for one.
3. Create: edit locally and push with Git, or use GitHub's browser editor when permitted. If neither is available, hand a patch or complete text to the human; do not claim a commit occurred.
4. Review: inspect the changed files, available checks and discussion in GitHub's browser. The merged `.github/workflows/review-packet.yml` supplies a model-free metadata summary on PRs, drafts included; compare it against the actual diff and do not mistake it for a human review. Record a receipt. When allowed, open a **draft** PR against the intended base using the GitHub UI; never merge by implication.
5. Respond: refer to the [canonical glossary](../../docs/latin-workflow-glossary.md) and `owner-cues.md` when Eric asks for a Latin review stage. The installed recorder logs qualifying calls and PR state; it does not itself review, call a model, finalize or merge. The separate explicit `@claude ultima Probatio` finalization cue is live and must not be used as an example command.
6. Handoff: note completed work, evidence, unresolved decisions and one next footfall; keep canonical findings in the PR review/discussion surface.

## Optional API-assisted pass

Only after an explicit opt-in: fetch relevant PR state and review receipt, compare evidence to the task's acceptance condition, and propose a concise gap report. Restrict scope to the named PR and phase. Start with a dry run; make no writes or paid model calls without separate permission. Track provider usage separately from GitHub Actions usage. If the provider can automatically switch to paid consumption, configure and verify its own hard stop before enabling the adapter. No API availability must still leave the browser/local path complete.
