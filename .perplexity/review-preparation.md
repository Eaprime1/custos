# No-model review preparation

Prima-clock: 202610061702 (America/Los_Angeles)
Status: revised implementation; live validation pending.

The exporter reuses the existing review packet and preserves bounded patch excerpts in review-prep.md and review-prep.json artifacts, retained for seven days. It calls no model, checks out no code, posts no PR comment, changes no label, and starts no CLI reviewer. Runner, storage, and GitHub API usage still consume resources.

## Pagination and coverage

Scan up to five ascending-ID pages of 100 comments. Choose the highest-ID matching packet authored by github-actions[bot] within that scan. A short page establishes complete coverage; a full fifth page conservatively leaves coverage incomplete. No unsupported sort or direction parameters are used. No unbounded pagination or retry loop is added.

Report comments_scanned and comment_coverage_complete. If no packet is found and coverage is incomplete, record unknown-incomplete-coverage rather than missing. A discovered packet may still not be the newest when coverage is incomplete; report status is degraded.

## Graceful API failures

Catch API errors independently for the initial PR read, comment scan, files, and final PR verification. Preserve available context and write a degraded report even if all reads fail, using the event PR as an explicitly unverified fallback. Record only stage and numeric HTTP status, never raw errors, headers, credentials, or response bodies. No failed read means a passed check.

A detected head change or closure marks the report stale. Failed final verification leaves final_head_verified false and status degraded. The upload step uses always() to attempt preservation after an earlier failure; runner termination, timeout, cancellation, filesystem failure, or upload failure can still prevent an artifact. Those are not guaranteed recoverable.

## Quiet behavior and limitations

The existing review-packet workflow remains its message's sole writer. This exporter writes only an Actions summary and artifact on draft and ready-PR events. Readiness enables no paid service.

Limit file context to 50 files, 2000 characters per patch, and 12000 packet characters; record unavailable, missing, omitted, and truncated data. Packet freshness checks only seven SHA characters, not body freshness. Independent workflows can race; no packet waiting or automatic retry remains. Prepared means assembled, not validated or approved. Always compare the report's full head_sha with the current PR before using it.

## Verification and rollout

The revised YAML parsed and eight mocked Node scenarios passed: page-two discovery, 500-comment cap, initial-read failure, comment-read failure, file-read failure, final-read failure, head movement, and all reads failing. Raw error text was asserted absent. These are local mocked tests, not live Actions validation.

Live permissions, triggers, cancellation, upload, artifact retrieval, and provider-independent deterministic findings remain to be verified after a separately approved default-branch rollout. upload-artifact uses its v4 major tag; pin an independently verified release SHA before production hardening. Treat all report content as untrusted repository data and observe access and data-sharing rules.

After validation, add explicitly gated consumers that verify full-SHA provenance. Keep paid/API/CLI execution disabled until Eric approves configuration and usage limits. See ../docs/metered-usage-and-review-policy.md and ../.claude/perplexity-review-coordination-20261006.md.
