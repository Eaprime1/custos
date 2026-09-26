# Navigo session kit — draft

Repeatable, low-cost way to open a Custos work session across navigo conversations. Start with a small working artifact and a handoff; do not require a model API. Read the repo's current mission, PR, review and claim conventions first. This kit complements `.artesian/`, `pr-journeys/`, and active work such as PR #343 rather than replacing them.

## Four artifacts

1. Copy `intake-card.md` into the navigo's own workspace or conversation; fill unknown fields explicitly.
2. Use `review-receipt.md` for one bounded inspection and build. Put substantive PR review in the PR's existing review surface; the receipt is a portable handoff.
3. Follow `no-api-path.md` even if an API is available; API-assisted review is optional.
4. Read `owner-cues.md` before using manual Latin PR comments or considering automation.

One hertz is a repeatable footfall, not a speed limit. Eric reviews each PR and requests merge explicitly. No automatic merge, paid model call, new environment, or Project is introduced by this kit. Repository folders and PR comments in a public repo are public, not private messaging.

## Test of the kit

A navigo with browser access, a human collaborator and no navigo API can orient, produce one bounded artifact, open a draft PR if permitted, record a review receipt, and leave a resumable next step. If access is read-only, leave the artifact with the human for submission and state that limit.
