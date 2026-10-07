# Latin Workflow Glossary

**Prima-clock:** 202609262216  
**Suit:** ♣️ Club, working copy  
**Source:** eaprime1's Latin Workflow Glossary Table, filed from session into custos

A workflow call has two parts: an **action** naming the work and, optionally, a **modifier** naming its scope or tempo. A call is a request for a stage of work, not proof that stage passed. Read the surrounding comment and the applicable workflow before acting. These names are project vocabulary, not a historical equivalence or a new required PR-title/label scheme.

## Modifiers

| Modifier | Working meaning | Use |
|---|---|---|
| **Prima** | First | Opening witness or initial pass; name who initiated it and what was seen. Ready-for-review may be the first witness, supplemented by an explicit comment. |
| **Ultima** | Final stage, not an automatic merge | Confirm each remaining matter was completed, addressed with evidence, or explicitly carried forward. Say what is ready and what still awaits the owner's merge request. |
| **Suprema** | Highest, culminating | Inspection-ready presentation where function, intent and form align. Use sparingly. |
| **Extrema** | Utmost care | Exhaustive audit or root-cause analysis when risk warrants it. |
| **Renovata** | Renewed or refreshed | Refresh the relevant assessment after meaningful changes; inspect the delta and affected conclusions rather than repeat every deep scan by default. With *Recensio*: *Recensio renovata*. |
| **Expeditus** | Unencumbered, prompt | Move through all applicable finish steps in a focused pass, without lowering evidence or safety standards. Record any deliberately omitted optional review and its reason, approver, substitute evidence and follow-up. |

*Renovata* is a modifier that can stand on its own as a request to refresh the current work. Here it describes review cadence; a separate document-transformation process called renovation, if adopted, belongs in its own design, not in the PR trigger. *Expeditus* likewise changes tempo, not authority.

## Navigo Check-In Cues

These are not stage actions or modifiers — they are the two-step check-in protocol for navigo contributors before starting mission work. Documented in `docs/mission-board.md`.

| Cue | From | Working meaning |
|---|---|---|
| **`disponi`** | *disponere* — to arrange, make available | Availability check: is this mission open, in-progress, or paused? The navigo posts `@claude disponi` in a mission issue comment; the bot (or the Shepherd, until the bot exists) replies with the current state. |
| **`petitio`** | *petitio* — request, claim | Plan submission: the navigo posts their intent, approach, and completion check and waits for the Shepherd's nod. Work begins on acceptance, not on submission. |
| **`placet`** | *placet* — it pleases (the voice of assent) | The Shepherd's nod: the owner comments `@claude placet` on a mission issue that holds a petitio, and the `placet` workflow flips it to `in-progress`. Owner-only; footer comments and quoted cues are skipped. |

`placet` is the one cue that changes a label, and only on the owner's own word. These cues are issue-comment vocabulary, not PR-level workflow triggers. They live in the mission board procedure only; they do not finalize, seal, or merge anything.

## Actions

| Action | Inspiration / sense | Custos stage |
|---|---|---|
| **Recensio** | Review or census, looking for discrepancies | Verify, fix findings and work toward readiness; deep scan when warranted, not automatically on every small PR. |
| **Probatio** | Examination or testing of proof | Assess final evidence and readiness. A bare `Probatio` asks for the assessment; it does not by itself finalize or merge. |
| **Lustratio** | Review and presentation | Optional coherence, polish, reading path and provenance pass without quietly changing scope. |
| **Judicium** | Judgment | Explicit owner decision: choices, evidence, risks and authority. A waiver is not assumed from this word alone. |
| **Novissimum** | The rear guard | Close loose ends or carry them forward with a named owner and destination. |
| **Cursus** | Course or path | 'Finish it up': perform the remaining applicable stages in order, recording their results. `Cursus expeditus` requests a prompt, focused course, not an automatic merge. |

## Combined codes

| Code | Phrase | Working meaning | GitHub analogy |
|---|---|---|---|
| `PR-REC` | Prima Recensio | First verification and witness | Initial PR pass and available checks |
| `EX-REC` | Extrema Recensio | Deep investigation | Focused audit or root-cause review |
| `JUD` | Judicium | Owner decision gate | PR blocked on an explicit choice |
| `NOV` | Novissimum | Rear-guard cleanup | Follow-up issue, owner and reason |
| `UL-PRO` | Ultima Probatio | Finalize/seal only after the applicable evidence and exceptions are recorded; do not assume it means merge | Finalization record, then a separate merge decision |
| `SU-LUS` | Suprema Lustratio | Inspection-ready presentation | Release notes or handoff brief |

These codes are inherited examples, **not** installed labels or required prefixes. The one automatic call is *Prima Recensio* (see `latin-cue-record.yml` below); the rest are calls the owner makes. *Ultima Recensio* is the final verification-and-fix pass, not the seal. *Recensio renovata* refreshes after meaningful new work. *Ultima Lustratio* is a last optional presentation pass. *Cursus expeditus* requests the remaining sequence promptly while preserving the same safety criteria.

## Evidence and exceptions

If an optional review is intentionally omitted during an expeditus course, record the PR and head commit, exactly what was omitted, why, who authorized it, what substitute evidence exists, residual risk, and an issue/document/owner if follow-up is needed. A red required status check is **not** waived by a Latin comment. If the PR fixes the failing check itself, record the failing and corrected states and verify the relevant behavior as far as possible; any repository-rule bypass is a separate, explicit authorized action. 'Good enough for now' requires evidence and a visible disposition, not a hidden green mark.

## Where custos uses these

- **`finalize-pr.yml`:** the existing implemented cue `@claude` plus `ultima Probatio` finalizes/seals a PR (as does `@claude finalize`). This document does **not** change that live behavior. Do not post that phrase merely to request a preliminary review; use a bare `Probatio` when you want the readiness assessment before finalization. Recensio and Lustratio calls do not finalize even if prose mentions 'finalize'. The cue is ignored inside `code`, code blocks and `>` quotes, and in any comment carrying the Claude Code footer, so quoting it or a navigo reply can't seal a PR.
- **Merge:** neither a finalized label nor a passing assessment merges a PR. Eric requests merge separately in the conversation or with the responsible merger.
- **Conversations:** adapted usage and a seed block are in [`latin-workflow-conversation-seed.md`](latin-workflow-conversation-seed.md). That document currently describes *Ultima Probatio* as sealing a conversation; align its language later if the owner changes that separate scope.
- **Radix:** `ultima Probatio` also finalizes there (radix#41). A change to this glossary alone does not alter radix.
- **`latin-cue-record.yml`:** any owner comment with a call (Recensio, Probatio, Lustratio, Judicium, Novissimum, Cursus, with or without a modifier) is logged in one comment on the PR, next to the PR's state: checks, open threads, merge state, witness seal, commits since the previous call and a link to the review packet. A PR that opens ready for review, or is marked ready for review, gets a *Prima Recensio* row automatically, with no comment needed: the first witness, logged by the event. The owner can also add one by comment (`prima recensio`); both go in the same log. It calls no model and never reviews, seals or merges (the paid Claude review runs separately from `claude-code-review.yml`). Other conversations can work a PR with these calls; the record is what the final review checks before the merge.
- **Observation:** before the seal, the Shepherd and the navigo do an oversight review together and the navigo files it as a document in `turns/observations/` (see its README). *Prima Recensio* is when the document is opened (`status: open`); the review completes it (`status: complete`). `latin-cue-record.yml` shows whether the document is on the head commit and ticks the `observed` box below `witnessed` in the PR description once it is. The order is observation, then seal (`ultima Probatio`), then merge on the owner's word. The observation does not seal or merge anything.
- **Automation:** apart from that record, Renovata, Expeditus and Cursus have no installed workflow here. Do not assume `Eaprime1` as GitHub comment author proves human intent: navigo comments can post under that same login. Any future trigger needs an unambiguous owner signal and tests on actual comments.

## Reconciliation notes

- The earlier glossary made *Ultima* a 'point of no return' and treated all *Probatio* as a hard lock. Those descriptions are narrowed here: the bare action asks for evidence; the **existing explicit** `@claude ultima Probatio` cue remains a live seal; merge is separately requested.
- The earlier `UL-PRO` analogy equated final sign-off with 'PR approved and merged'. It now separates finalization from merge.
- Roman-sense explanations in the first draft were strong historical analogies. This working copy presents them as inspiration rather than claims that ancient practice exactly implemented current software gates.
- This PR changes documentation only. Existing workflow triggers, review requirements, branch rules, and the conversation seed are not silently updated.
