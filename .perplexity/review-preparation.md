# No-model review preparation

Prima-clock: 202610061651 (America/Los_Angeles)
Status: first implementation; live validation pending.

The Perplexity preparation workflow exports the existing review packet plus bounded patch excerpts. It does not duplicate the packet's deterministic scans, post a new PR comment, change labels, invoke a model, or start a CLI reviewer. Repository API requests, runner time, and artifact storage are still resources; no model usage does not mean universally free.

## Report access

Open the Custos — Perplexity Review Prep run in GitHub Actions. Its artifact contains review-prep.md and review-prep.json, retained for seven days. Bring the files into a conversation for review when an automated reviewer is unavailable. Always compare the report's full head_sha with the current PR head before relying on it. Files are snapshots, not permanently current reports.

## Quiet behavior

The existing review-packet workflow remains the single writer of its PR message. This exporter writes only an Actions summary and artifact. Draft and ready-PR updates refresh preparation without model calls. A readiness event does not enable paid services.

The exporter looks for the existing packet in the latest 100 comments and waits at most twice for five seconds. Because the workflows run independently, a packet can still be missing or stale; that state is preserved honestly rather than retried indefinitely. Current-short-sha describes only the packet's seven-character head match, not full-SHA verification or body freshness. A head change observed during collection marks the report stale.

Coverage is bounded to 50 files, 2000 characters per patch, and 12000 characters of packet text. Missing/truncated patches and omitted files are recorded. The exporter does not claim syntax validation, complete diff coverage, link resolution, approval, sealing, or merge readiness. No packet means its deterministic findings are unavailable, not passed.

## Safety and rollout

The workflow uses trusted inline code, no checkout, read-only repository permissions, and no model credential. PR text and patch content are data only. Review artifacts can contain repository content; observe repository access rules and consider data-sharing permissions before passing them to any external reviewer.

The github-script action is pinned. upload-artifact currently uses its v4 major tag; pin an independently verified release SHA before production hardening.

The pull_request_target workflow must reach the default branch through a separately approved merge before its normal events exercise this implementation. Do not claim a live run while it is only on the working branch. Validate draft updates, readiness, body edits, converted-to-draft events, packet absence/staleness, large diffs, missing patches, concurrent pushes, and artifact retrieval. Confirm no extra PR messages or model calls. Static and live tests have not yet been completed.

## Next increment

After validation, add a gated reviewer that consumes the report and verifies the full head SHA. Keep paid/API/CLI execution disabled until Eric approves provider, credentials, usage limits, and triggers. Preparation remains independently usable if that reviewer fails.

See ../docs/metered-usage-and-review-policy.md and ../.claude/perplexity-review-coordination-20261006.md.
