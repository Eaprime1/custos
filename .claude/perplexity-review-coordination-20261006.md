# Perplexity review coordination

Prima-clock: 202610061634 (America/Los_Angeles)
Status: design agreement; implementation and live verification pending.
Perspective: Navigo Perplexity with Eric. This note is not an approval, seal, mission claim, or merge instruction.

## Eric's direction

Avoid repeated review cycles, comment clutter, and unnecessary work. Draft PRs should receive simple deterministic checks after changes, without model usage. Most substantive review happens after a PR becomes ready for review. Preparation must remain useful when CLI usage is exhausted or a reviewer fails. Eric will configure any required model API credential himself; no credential belongs in this document or conversation.

## Proposed layers

1. Preparation: no model call and no authenticated model CLI. Build on the existing review packet rather than duplicating its inventory. Gather obvious issues and a bounded report tied to the current PR head SHA.
2. Reporting: keep one shared review message updated in place, with clearly owned sections; retain downloadable report artifacts for conversation-based review. Draft checks should not create a new comment on every push. Coordinate writers to avoid overwriting each other's sections.
3. Perspective review: after readiness, an optional API-based review can consume the prepared material. Non-CLI model review still has API cost; preparation itself must not require a model token.
4. Optional CLI review: consume the same report only after preparation succeeds and an explicit usage gate permits it. Prefer a dependent job in the same workflow. Do not enable or assume a Perplexity CLI integration exists; its provider and authentication remain to be verified.
5. Fallback: preserve preparation reports when credentials are absent, quota is exhausted, or an optional reviewer fails. Report the reviewer as unavailable without automatic model retry loops. Eric and a conversation-based Navigo can still review the report.

## Trigger and label coordination

The recovered claude-code-review.yml patch at c7c4e1ca907af01370987be67710cd461660ade5 uses opened, ready_for_review, and labeled events. Its job expression allows ai-review on a draft and does not explicitly require the labeling actor to be Eric. These are observations from recovered source, not findings from a live trigger test.

For the new Perplexity design, require non-draft state for every model/CLI path. Treat synchronize as preparation-only: no automatic model review on ordinary pushes, including pushes to a ready PR. Owner-requested ai-review should be a deliberate rerun, not a label that preparation adds automatically. An initial ready review and a deliberate rerun are separate requests; do not repeatedly consume a persistent label on each update.

Do not modify Claude's workflow or the shared ai-review label semantics in this PR without coordination. The existing label description names paid Claude review; expanding it to multiple voices could multiply cost and requires an explicit decision. No bot comment, report update, or label side effect should fan out into another paid review.

Before a model call, verify the prepared report matches the current head SHA. Deduplicate by PR, head SHA, reviewer, and request identity; deliberately requested reruns remain possible. Stale reports must not be presented as current reviews. Bound inputs, output, runtime, and requests; record truncation or missing patches.

## Safety and verification

Use trusted workflow code and API data; do not execute PR code in a privileged preparation job. Treat PR text and model output as untrusted data, not instructions for tools, shell commands, seals, or merges. Keep permissions minimal and secrets out of logs and reports.

Test draft updates, readiness, unrelated labels, deliberate reruns, ready-PR pushes, missing credentials, reviewer failure, stale head changes, and concurrent report updates. Assert no model call during draft or ordinary pushes and no repeated comments. Do not claim completion until a real PR has produced a useful report; optional paid/CLI paths remain unverified until separately tested with Eric's permission.

## Session state

Working branch: perplexity/pr-review-20261006, created from main at 0555dd7668dfd79d36b00b10ded2446619f0bebe.
This note changes no workflows, labels, secrets, or spending settings. The implementation and a draft PR are subsequent separately reviewed writes.

Enjoy the journey.
