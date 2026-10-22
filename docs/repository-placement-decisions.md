# Draft-stage repository placement decisions

**Status:** working proposal for oversight
**Scope:** decide where proposed content belongs while its pull request is still a draft.

This checkpoint is separate from contributor review, the Probatio packet, final oversight, and merge. It is intended for a new top-level path, a dot-folder, or a substantial move into a new location. Routine changes in an established path do not need a placement ruling.

## The small process

1. The author opens a **draft PR** and completes the Repository Placement section of the PR template. Name the existing path or proposed new path and explain why established locations do not fit.
2. The author makes a `petitio`: a concise request naming the choice to be made, purpose, scope, alternatives, and consequences. Keep the request in the draft PR so it travels with the change.
3. The author asks for a `judicium` when a decision is needed. The decision record states the options, evidence, recommendation, risks, and what each result permits.
4. The Shepherd records `placet` for an accepted placement, or records **revise** or **deferred** with the reason. The draft PR records the outcome. A decision can be made before the content is ready for contributor review.
5. After the location is accepted, the author continues the draft. When content is ready, use the separate Probatio process in `docs/latin-workflow-v2.md`.

A placement `placet` approves the location and bounded scope only. It does not approve the content, request or complete a Probatio review, make the PR ready for review, grant the final seal, or authorize merge.

## Outcomes

| Outcome | Meaning | Next step |
|---|---|---|
| **accepted** | Proposed path and bounded contents are approved. | Continue the draft at that path. |
| **revise** | The request needs a different path, clearer scope, or more evidence. | Update the placement request; remain draft. |
| **deferred** | A needed owner, source, or project decision is not available yet. | Record the dependency and wait; remain draft. |
| **not required** | Work uses an established path and does not create a new placement boundary. | Continue under the repository's ordinary review process. |

## Minimal decision record

Record this in the draft PR description or a linked decision note:

- Requester and date.
- Existing or proposed path.
- What belongs there and what is explicitly out of scope.
- Why the current structure does not fit (for a new path).
- Options considered and relevant evidence.
- Recommendation and risks.
- Shepherd's outcome and rationale.
- Any conditions, owner, or follow-up.

Do not create a dot-folder simply because the content is private, sensitive, or not yet approved. A path decision is not a substitute for repository access controls or a content review.

## Pilot: `.ethica`

A proposed `.ethica` directory is a useful pilot because a dot-folder creates a new repository boundary. The placement request should identify the exact files proposed for the first PR, their provenance, and what remains a later phase. The first decision can approve a bounded location and initial scope while the PR remains draft. It does not imply approval of unseen source documents or a future pipeline.

When describing the physical anchor, retain “Mulberry at the corner of Suxen and Nexus” if relevant and omit the ZIP code. Treat the photo-anchor system as future work unless its implementation is included and verified in the PR.

## Relationship to review and seals

- **Placement checkpoint:** draft-stage path and scope decision using `petitio`, `judicium`, and the Shepherd's `placet`.
- **Contributor soft seals:** each contributor records readiness on the exact PR head.
- **`^omnes probatio`:** requests a Probatio review from every contributor able to provide one.
- **`^chatgpt probatio`:** asks ChatGPT to verify the available soft seals and reports, then prepare a consolidated Probatio packet for the oversight observer. The packet names missing reports, open questions, and matters requiring an oversight decision.
- **Final oversight and `ultima probatio`:** the observer's review and the owner's final seal remain later, distinct steps. Neither placement acceptance nor a Probatio request is the final seal or merge approval.
