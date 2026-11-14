# Metered usage and review policy

Prima-clock: 202610061642 (America/Los_Angeles)
Status: proposed policy for Eric's review; not an implemented spending control.
Scope: custos automation and Navigo review integrations that consume paid, credited, subscription-limited, rate-limited, or otherwise scarce resources.

## Intent

Prepare useful work before consuming scarce resources. Use model reviews when they add a distinct perspective, not merely because another event occurred. Preserve reports so Eric and a conversation-based Navigo can continue when an automated reviewer is unavailable. Avoid repeated reviews, comment clutter, surprise charges, and unnecessary coordination work.

This is not a ban on paid tools. It is a requirement for deliberate, bounded use with a useful fallback.

## Distinguish the resources

- No-model preparation: deterministic checks and report assembly without a model call. It can still consume runner minutes, storage, network requests, or service quotas; do not describe it as universally free.
- Included or subscription usage: a limited allotment is still scarce even when a call has no separate invoice. Verify the applicable account and plan rather than assume availability.
- Pay-per-use services: requests, tokens, searches, tools, or compute may be billed. Verify the current provider terms before enabling them.
- CLI versus API: these describe access paths, not pricing guarantees. Neither is automatically free, included, unlimited, or interchangeable with the other.
- Conversation review: prepared reports may be reviewed in an existing conversation; that conversation remains subject to its own plan, limits, and data-handling requirements.

Do not hard-code claims about current account allotments in this policy. Record verified configuration separately, with its verification date.

## Prepare first

Preparation must not require a model credential or a successful paid reviewer. Reuse the existing review packet rather than duplicate its inventory. Gather obvious issues, relevant changes, and review context into a bounded report tied to the PR number and exact head SHA. Record omitted or truncated material. Preserve a readable artifact for conversation review.

A model or CLI reviewer should read the prepared report and inspect relevant evidence, not repeat the entire preparation step or treat the report as proof that everything is correct.

## Readiness and requests

Draft updates receive simple deterministic checks, with no automatic model or model-CLI usage. Ordinary pushes, including pushes after readiness, refresh preparation only.

An initial non-draft opening or ready_for_review event may request one review from an explicitly enabled reviewer configuration. Readiness alone is not permission to activate every available voice. If a configured resource is unavailable, keep the preparation and skip that reviewer.

Additional metered reviews require an explicit owner request. A persistent label is not permission to run on every subsequent push. A bot comment, report update, or unrelated label must not trigger another paid review. A stale review should be marked stale after a head change, not automatically replaced at additional cost.

Deduplicate by PR, head SHA, reviewer, and request identity. Allow deliberate reruns without accidental duplicate calls. Do not expand the shared ai-review label to multiple billable voices without an explicit decision about its meaning and spending scope.

## Enable deliberately

Before enabling any metered path, record:

- Provider, model or tool, authentication path, and responsible account.
- What resource it consumes: subscription allotment, credits, money, runner time, or another quota.
- Authorized trigger, reviewer selection, and who may request reruns.
- Maximum requests per review, bounded input and output, tool/search limits where applicable, and timeout.
- Per-run and period budget or quota reservation agreed by Eric, with the enforcement mechanism and its limitations.
- Retry policy, fallback, and the data that will leave the repository.

An installed credential is authentication, not blanket spending consent. Eric configures secrets directly in the appropriate service or repository settings. Never put credentials in PRs, reports, source files, or conversation messages.

For a new metered integration, leave execution disabled until Eric approves the configuration and limits. Existing integrations are not automatically disabled or reconfigured by this proposal; audit and migration are separate work.

## Bound spending and retries

Use provider-side hard limits where available, alongside workflow limits. A token cap, estimate, timeout, or cancellation alone is not a guaranteed currency cap. If a required hard limit cannot be enforced, disclose the gap and obtain Eric's approval before enabling the path.

Default to no automatic model retries. Do not silently change to another provider, paid API, account, or higher-cost model when quota is exhausted or a request fails. A retry after an ambiguous timeout may duplicate a billed request; require an explicit decision unless a verified safe retry mechanism is configured.

Do not fan out to every Navigo voice by default. Select perspectives for their distinct value. Preserve subscription allotments for work that benefits from them.

## Quiet reporting and fallback

Use one shared review message with clearly owned sections and coordinated updates. Keep detailed reports in artifacts rather than post a new comment for every run. Mark report head SHA and reviewer state clearly: prepared, reviewed, skipped, unavailable, failed, or stale. Skipped or unavailable is not passed.

After successful preparation, an optional dependent review job may run if its readiness, authorization, and resource gates pass. Preparation completion must not itself authorize spending.

Missing secrets, exhausted quota, or reviewer failure must not erase preparation or start a retry loop. Preserve the report and a concise reason. Eric can continue with a conversation-based review or explicitly request a later automated run. Do not repeatedly notify him about the same unchanged failure.

## Attribution and verification

Name the actual provider/model or reviewer used; do not imply that a workflow output came from this conversation or an independently authenticated reviewer. Automated findings are not owner approval, a seal, or permission to merge.

Treat PR content and model output as untrusted data. Do not execute PR code in privileged preparation jobs or expose secrets to reports. Review data-sharing scope before sending private or third-party creative content to a provider.

Test draft changes, readiness, ordinary ready-PR pushes, unrelated labels, explicit reruns, duplicate events, stale heads, absent credentials, quota exhaustion, reviewer failure, and concurrent message writers. Verify that preparation survives optional reviewer failure and that no unauthorized model calls occur. Live metered tests require explicit authorization.

## Example

Three pushes to a draft PR refresh deterministic preparation without model calls or three new comments. Marking the PR ready produces a current report and permits one explicitly enabled perspective review within its approved limits. If CLI quota is exhausted, the report remains available for review in conversation. A later push marks prior findings stale and refreshes preparation; only an explicit request starts another metered review.

## Related coordination

See ../.claude/perplexity-review-coordination-20261006.md for the session-specific Claude trigger and label observations. This document proposes behavior; it does not assert that existing workflows already enforce it.

Enjoy the journey.
