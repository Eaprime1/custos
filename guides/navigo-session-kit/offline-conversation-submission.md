# Offline Conversation Submission — Portable Custos Intake

*An invitation for contributors whose conversation cannot write directly to GitHub.*

`suit: ♦️ Diamond — proposal, structure forming`
`prima-clock: 202610111156`
`status: proposed — draft PR; not an approved workflow`

## Purpose

A conversation, person, or AI may contribute without GitHub write access, a model API, or continuous contact with the receiving Navigo. This is a **handoff route**, not a substitute for the project's existing claims, witness records, or PR lifecycle. The receiving Shepherd remains responsible for placement and review.

## Portable Carrier — Copy into Any Conversation

Ask the contributor for one Markdown document with the following headings:

1. **Origin and consent** — identifying mark/handle (or pseudonym), platform/conversation if shared voluntarily; permission to submit to a public repository; attribution preferences.
2. **Intent** — what was the work trying to accomplish?
3. **Original contribution** — the contributor's actual text, or an accurate linked source artifact; distinguish verbatim text from edited or summarized content. Do not silently alter authorship or claims.
4. **What moved** — decisions, named concepts, created files, discoveries, corrections.
5. **Seeds and proposed destination** — `atelier/`, `pre-nullus`, world-state, clock/ledger, or `OPEN-routing-pending`. Never force an unconfirmed destination.
6. **Safety and uncertainty** — remove credentials and sensitive information before public submission; mark unverified assumptions and external claims.
7. **Handoff receipt** — submitted by, received by, date/time (including timezone if known), source provenance, any limits, and requested next action.

A contributor without access may supply this carrier through an existing shared Google Drive staging folder or directly to a connected Shepherd. **No new public-link sharing is required.** Drive placement is staging, not a GitHub commit or approval.

## Receiving and Routing

1. Preserve the original contribution, including its author or Navigo marker, without claiming that it was independently verified. Avoid copying private transcripts to public GitHub without explicit permission.
2. Distill a **Conversation Arc** per `guides/conversation-finalization-protocol.md`; the arc supplements rather than replaces the source.
3. Consult `guides/navigo-session-kit/README.md`, `intake-card.md`, `no-api-path.md`, and `.artesian/claim-carrier-template.md` if a mission is involved.
4. When the destination is unknown, keep `OPEN-routing-pending`. For exploratory seeds use the established atelier/pre-nullus convention; do not assign vault status without confirmation.
5. Open a **draft PR** on a dedicated branch for changes proposed to Custos. Follow the *existing* `.github/PULL_REQUEST_TEMPLATE.md` and `guides/pr-lifecycle.md`. Do not invent approval, witnessing, observation, or scanning results.
6. Record the exact URLs/paths of source, carrier, and PR in the handoff receipt; leave reviewers a concrete next action.
7. The Shepherd decides whether and when to signal ready for review, finalize, and merge. No automatic merge, bypass, or forced seal.

## Minimum Receipt

```text
Contribution title:
Origin / contributor mark:
Consent for public submission: yes / no / pending
Source artifact (Drive or other):
Carrier path:
What is verbatim vs adapted:
Requested destination:
Open questions:
Received by / timestamp:
Draft PR:
Status: RECEIVED / STAGED / PROPOSED / REVIEWING / CLOSED
```

## Boundary Conditions

Public repository files and PR comments are public. A Drive item is not automatically public or safe for public copying. A secret scan is useful but does not validate licensing, ethics, claims, provenance, or contributor consent. An unavailable tool or missing connection must be recorded honestly; never claim a source has been verified when it has not.

## First Rehearsal

The companion document `atelier/gitguardian-security-proposal-intake-20261011.md` receives a 25-page PDF proposal concerning GitGuardian. Its configuration blocks are **not applied** to live CI in this draft; they require reconciliation with existing repository files and confirmation of actual hook/API availability.

---

Related: `guides/conversation-finalization-protocol.md`, `guides/pr-lifecycle.md`, `guides/multi-ai-workflow.md`, `turns/TURN_SCHEMA.md`.

*The doorway accepts a contribution. The review process decides how it grows.*
