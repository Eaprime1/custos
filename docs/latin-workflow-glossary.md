# Latin Workflow Glossary

**Prima-clock:** 202609262216
**Suit:** ♣️ Club, working copy
**Source:** eaprime1's Latin Workflow Glossary Table, filed from session into custos

A workflow call has two parts: a **modifier** that sets the scope and
intent, and an **action** that names the stage. The words carry Roman
administrative, military and legal weight, and they don't collide with
native tool keywords such as "Review" or "Approved".

## Modifiers

| Modifier | Meaning | Use |
|---|---|---|
| **Prima** | First | Initial triage, automated scans, first-pass review. |
| **Ultima** | Final, terminal | The hard stop. The point of no return. |
| **Suprema** | Highest, the balance point | Inspection-ready: beauty, function and intent align. The Commander's Standard. |
| **Extrema** | Utmost care | Pushed to the edge: an exhaustive audit or root-cause analysis. |

## Actions

| Action | Roman sense | Workflow stage |
|---|---|---|
| **Recensio** | The census: a meticulous review and registration of people and assets, to find discrepancies | Verification and deep scan: find issues and recommend fixes. The analytical, data-gathering phase. |
| **Probatio** | The official inspection of proof. Once passed, the contractor was released and no more changes were made. | Sign-off and hard lock. The final gate; once granted, the work is frozen. |
| **Lustratio** | The purification rite, held as a gleaming military review: armour polished, standards raised | Presentation: polish reports and formatting so the work shows its best face. |
| **Judicium** | A formal legal judgment | The decision gate: a waiver, architectural choice or owner's ruling needed to move on. |
| **Novissimum** | *Agmen novissimum*, the rear guard that closes the march | Cleanup: close open items, record technical debt, finish the status notes. |

## Combined codes

| Code | Phrase | Meaning | GitHub analogy |
|---|---|---|---|
| `PR-REC` | Prima Recensio | First verification: automated triage, syntax checks, first scan | CI linting, first automated PR checks |
| `EX-REC` | Extrema Recensio | Utmost-care deep dive: forensic audit or root-cause analysis | Deep peer review, security audit, edge-case testing |
| `JUD` | Judicium | The decision gate that breaks a deadlock | A PR blocked on a maintainer or owner decision |
| `NOV` | Novissimum | Rear-guard cleanup and the reason for closing | Final triage, docs updates, issues moved to the next milestone |
| `UL-PRO` | Ultima Probatio | Final sign-off. Frozen; all changes cease. | PR approved and merged, code freeze, release tagged |
| `SU-LUS` | Suprema Lustratio | Supreme presentation: inspection-ready reports and visuals | Release notes, public changelog, executive brief |

Other pairings follow the same pattern: *Ultima Recensio* is the final
review pass (fix what's found), and *Ultima Lustratio* is the last polish
before sign-off.

## Where custos uses these

- **`finalize-pr.yml`:** a comment that mentions `@claude` and says
  `ultima Probatio` finalizes and seals a PR, like `@claude finalize`.
  Recensio and Lustratio comments never finalize, even when they contain
  the word "finalize".
- The codes are not yet labels or PR-title prefixes. Enforcing a title
  prefix on every PR is a separate owner decision (a Judicium), not part of
  this glossary.
- **Conversations:** the same calls, adapted to steering a session with a
  navigo, are in
  [`latin-workflow-conversation-seed.md`](latin-workflow-conversation-seed.md).
  It includes a seed block to paste in when starting a conversation.
- **radix:** `ultima Probatio` finalizes there too (radix#41).
