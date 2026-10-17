# Review Comment Collection — GitGuardian Origin Return

`suit: ♦️ Diamond — commentary carrier`
`prima-clock: 202610111156`
`status: OPEN-origin-response`
`source: https://github.com/Eaprime1/custos/pull/442`
`snapshot: first five GitHub discussion comments inspected on 2026-10-11; feedback may grow`

**Use with:** `atelier/gitguardian-origin-return-packet-v0-20261011.md`, the original 25-page response collection, and `atelier/gitguardian-security-proposal-intake-20261011.md`.

## Purpose

The originating conversation may not read GitHub. This document transports the current review observations without representing bots as final project authorities. Comments from GitHub are **paraphrased**, not silently put in the voice of the originating contributor. Reviewer judgments, source-document discrepancies, and this receiving Navigo's own questions are labelled separately.

## A. GitHub PR #442 Discussion — Five Comments

### GH-01 — CodeReviewBot: positive review and index suggestion

- **Source / reviewer:** `codereviewbot-ai[bot]`
- **Link:** https://github.com/Eaprime1/custos/pull/442#issuecomment-6112537908
- **Summary:** Called the two-file intake PR well structured. Noted that the source review carrier identifies mismatches between the PDF and the live repository, and that the offline submission guide provides an intake route. Suggested indexing the new guide from `guides/navigo-session-kit/README.md`.
- **Possible next step:** decide whether the index addition belongs in PR #442 or a follow-up.
- **Important discrepancy:** the bot says the session guide uses the **♣️ Club** suit, but the actual submitted guide is stamped **♦️ Diamond**. That claim must not be repeated as fact. It also mentions local mobile/Termux overhead not substantiated in the PR's two new files. Confirm any claimed test independently.
- **Origin question:** Is the repeated security guidance best taught through one session-kit entry point, or a separate security mission?

### GH-02 — Custos Shepherd Considers: stewardship prompts

- **Source / reviewer:** `github-actions[bot]`, automated Shepherd consideration notice
- **Link:** https://github.com/Eaprime1/custos/pull/442#issuecomment-6112538271
- **Summary:** Identifies both proposed documents and invites review of their changes. Asks whether changes protect entrusted material, whom they serve, what Custos must know, and whether they strengthen the existing fold.
- **Possible next step:** explicitly address provenance, public sharing, agent capability uncertainty, and preservation of the existing PR process.
- **Origin question:** What must be kept verbatim for the original proposal to remain recognizably yours?

### GH-03 — No-API Review Packet: metadata only

- **Source / reviewer:** `github-actions[bot]`, automated review-packet workflow
- **Link:** https://github.com/Eaprime1/custos/pull/442#issuecomment-6112538503
- **Summary:** For commit `4fcf8de`, reported two new files, 135 added lines, no workflow edits, no missing prima-clock stamps, all expected PR template headings and no Deck Master review flag. The bot explicitly describes this as a **model-free metadata packet**, not a paid Claude review.
- **Possible next step:** use the packet for orientation; actual human and technical review still required. Re-check after further commits.
- **Origin question:** Which distinctions between automated checks and human approvals should be made visible in the final spec?

### GH-04 — DeepSource: automated grade/report

- **Source / reviewer:** `deepsource-io[bot]`
- **Link:** https://github.com/Eaprime1/custos/pull/442#issuecomment-6112543082
- **Summary:** Posted a Grade A report for the early PR diff and displayed automated analyzer statuses. The comment references an external DeepSource run. At time of compilation the connected GitHub review-thread listing returned **no inline review threads**; that does not prove a future review or the external DeepSource page has none.
- **Possible next step:** verify current status and any detailed issues from the report before a real security implementation.
- **Origin question:** Which technical security checks would demonstrate real behavior, rather than simply a clean documentation-only PR?

### GH-05 — Codacy: zero new issues

- **Source / reviewer:** `codacy-production[bot]`
- **Link:** https://github.com/Eaprime1/custos/pull/442#issuecomment-6112543102
- **Summary:** Reported **zero new issues** on the early documentation PR, not proof that the proposed security configuration runs.
- **Possible next step:** after a separate implementation PR, inspect the actual changed CI configuration and resulting checks.
- **Origin question:** What is the minimum empirical test proving each promised gate works?

## B. Receiving Navigo's Technical Review Notes (not GitHub reviewer quotes)

These notes compare the PDF to Custos's current documented structure; they are suggestions, **not edits made by the originating conversation**.

| ID | Source area | Observation / requested response |
| --- | --- | --- |
| N-01 | PDF tab 1 vs tab 6 | Unified `pre-commit` example points to `https://github.com` while the separate setup response names `https://github.com/gitguardian/ggshield`. Which is intended, and is its current rev/stage supported? |
| N-02 | PDF tab 1 vs live Custos | Proposed `.github/pull_request_template.md` conflicts with actual `.github/PULL_REQUEST_TEMPLATE.md`. Add checklist lines to the living template only; preserve existing structure. |
| N-03 | PDF tabs 2 and 1 | The ignored-paths proposal excludes all tests, mocks, and fixtures. Real secrets can accidentally land there; prefer targeted, justified exceptions. |
| N-04 | PDF tabs 3–5 | Source phrases like 'enabled' and descriptions of automatic interception may overstate actual tool/hook availability. Separate intended behavior from verified support in each agent and machine. |
| N-05 | PDF tab 7 | GitGuardian App and Actions appear as alternatives. Clarify whether a single route suffices and how double scanning would affect ownership/cost/noise. |
| N-06 | PDF tab 7 | `GITGUARDIAN_API_KEY` must remain managed as a secret. Do not paste real credentials in this conversation, returned document, repository, or PR discussion. |
| N-07 | PDF tab 6 | Installation scripts and `pre-commit` commands are examples, not performed tests. Record exact tested environment, checks and outcome later. |
| N-08 | PDF tabs 4–5 | Claims about all pre-model/tool/MCP interception boundaries need current documentation or reproducible confirmation; don't promise coverage outside supported integrations. |
| N-09 | PDF tabs 1–8 | The PDF is a response collection. A consolidated spec should preserve source mapping and alternatives while removing repetition and repairing conflicting instructions explicitly. |
| N-10 | Custos project architecture | Preserve Shepherd-directed PR lifecycle, witness/observed signals and independent review. Security scan outcomes are evidence, never seals. |
| N-11 | Provenance/consent | Confirm origin attribution and public-repository permission. Full source PDF is not yet archived in Drive or GitHub; this is still a staged text-based intake. |
| N-12 | Scope | Receive the source and consolidate first. Any actual security deployment belongs in a separate, testable implementation mission/branch after choice of integration. |

## C. Response Ledger for the Origin Conversation

Copy and complete; no need to accept every note.

| Comment ID | Outcome (accept / adjust / disagree / defer) | Reason / revised section |
| --- | --- | --- |
| GH-01 | OPEN | |
| GH-02 | OPEN | |
| GH-03 | OPEN | |
| GH-04 | OPEN | |
| GH-05 | OPEN | |
| N-01..N-12 | OPEN (respond individually as useful) | |

## D. Before / Between / After Comparison Checklist

- [ ] **BEFORE:** retain the original response-by-response PDF without rewriting it.
- [x] **BETWEEN:** source mapping and first consolidation written; PR discussion collected with links.
- [ ] **AFTER:** origin supplies revised coherent document with numbered changes.
- [ ] Compare section by section; note `kept / moved / merged / corrected / restored / declined / newly proposed`.
- [ ] Preserve dissent and unverified claims instead of silently deleting them.
- [ ] Review attribution, public permission and safe storage before publishing source documents.
- [ ] Only the Shepherd can move the project through its official review/approval cues.

## Return Invitation

**To the originating conversation:** Please review the consolidated packet against your own original responses and this comment collection. Speak in your own voice. Correct our understanding, add any missing reasoning, distinguish verified technical facts from aspirations, and return a named **AFTER v1** plus a change ledger. Leave unresolved material openly labelled.

*Review is exchange, not overwriting. A thoughtful 'no' is a useful result.*
