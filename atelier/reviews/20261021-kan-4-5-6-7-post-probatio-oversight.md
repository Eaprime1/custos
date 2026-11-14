# KAN-4 / KAN-5 / KAN-6 / KAN-7 — post-soft-seal oversight workspace

**Working record:** 20261021 (UTC)  
**Stage:** DRAFT / queued for a joint review once all four soft seals are complete  
**Keeper:** ChatGPT nav5, contributor review support  
**Decision authority:** Shepherd / independent oversight observer  
**Purpose:** preserve cross-PR findings, evidence and Shepherd observations without sealing or merging any source PR.

This is an **oversight carrier**, not a substitute for the canonical observation documents
under `turns/observations/` on an individual PR branch. No final oversight is claimed
merely because this draft exists. Avoid adding owner-only seal cues to this carrier.

## Scope and tracked heads

Re-read live head SHAs and checks at review time; these are **starting snapshots**, not
proof of future readiness. A later push may withdraw a soft seal.

| PR | Jira | Snapshot head | Soft label at setup | Review scope |
|---|---|---|---|---|
| [#468](https://github.com/Eaprime1/custos/pull/468) | [KAN-4](https://primalshadow.atlassian.net/browse/KAN-4) | `e66026d` | present | Eight High/Medium Codacy fixes, script/lint/Markdown intent |
| [#476](https://github.com/Eaprime1/custos/pull/476) | [KAN-5](https://primalshadow.atlassian.net/browse/KAN-5) | `1fe54a8` | present | 11 Markdown spacing findings, remaining KAN-5 work expressly out of scope |
| [#469](https://github.com/Eaprime1/custos/pull/469) | [KAN-6](https://primalshadow.atlassian.net/browse/KAN-6) | `3914ee8` | **not yet** | Jira guide, source-of-truth labels, reserved lexemes, Shepherd reference |
| [#470](https://github.com/Eaprime1/custos/pull/470) | [KAN-7](https://primalshadow.atlassian.net/browse/KAN-7) | `9377213` | present | Germ seed, module specs, consent boundaries, no live execution |

## Observation ledger update — 2026-10-22 UTC

These are **newer snapshots** than the initial scope table above; they supersede its
soft-label column for operational decisions. The Shepherd requested that observation
evidence and the review-bot resolution be logged. The checkbox in a source PR describes
**document existence**, not completion or seal readiness.

| Source PR | Latest observed head | Canonical observation | Human Shepherd marker | Source `observed` box | Current soft seal |
|---|---|---|---|---|---|
| [#468](https://github.com/Eaprime1/custos/pull/468) | `c7a5ad6` | [file](https://github.com/Eaprime1/custos/blob/fix/kan-4-codacy/turns/observations/202610212345_pr468_observation.md), **complete** | [present](https://github.com/Eaprime1/custos/pull/468#pullrequestreview-5606863377) | checked | withdrawn after head change |
| [#476](https://github.com/Eaprime1/custos/pull/476) | `12ed811` | [file](https://github.com/Eaprime1/custos/blob/fix/kan-5-list-spacing-batch-1/turns/observations/202610212345_pr476_observation.md), **complete** | **not found** in inspected PR comments/reviews | checked automatically because file exists; missing Shepherd marker remains noted | withdrawn after head change |
| [#469](https://github.com/Eaprime1/custos/pull/469) | `0233443` | [file](https://github.com/Eaprime1/custos/blob/docs/kan-6-jira-pipeline/turns/observations/202610212345_pr469_observation.md), **open** | [present](https://github.com/Eaprime1/custos/pull/469#pullrequestreview-5606934358) | checked (file exists; not complete) | not set on this head |
| [#470](https://github.com/Eaprime1/custos/pull/470) | `9377213` at previous inspection | Observation not checked in this ledger | not checked in this ledger | not evaluated here | previously present; refresh before joint review |

**#469 bot correction:** [review nit](https://github.com/Eaprime1/custos/pull/469#discussion_r4342762625) about `1/3` vs `2/3` structure forming corrected in [`22fca4b`](https://github.com/Eaprime1/custos/commit/22fca4bf0a91da896385e2facebc4528f00d536b); [individual reply](https://github.com/Eaprime1/custos/pull/469#discussion_r4343311740), thread resolved. The [observation addendum](https://github.com/Eaprime1/custos/blob/docs/kan-6-jira-pipeline/turns/observations/202610212345_pr469_observation.md) explicitly retains `status: open`. [Contributor's response to oversight](https://github.com/Eaprime1/custos/pull/469#issuecomment-6329590112) reports readiness qualifications and that the Shepherd must refresh the head-specific soft seal.

**#476 missing marker:** [evidence report](https://github.com/Eaprime1/custos/pull/476#issuecomment-6329590887) requests confirmation of the Shepherd observation comment; the canonical observation is already completed by the oversight reviewer. We did not invent an owner observation. Custos subsequently ticked the observed box because the file is present. The [PR description](https://github.com/Eaprime1/custos/pull/476) now distinguishes `status: complete` from the still-unverified separate owner comment marker.

**Operational effect:** filing observations advanced the source branch heads after earlier soft seals; do **not** regard any previous `ready-for-oversight` as current until a fresh owner-authored request succeeds on the current head. This draft carrier stays open and unsealed. Only populate its completed independent four-PR review after the entry conditions below are satisfied.

## Entry condition

- [ ] All four PRs have owner-authored soft readiness records for **their current heads**.
- [ ] All four retain `ready-for-oversight` and are not merged or closed.
- [ ] Fresh CI, external quality checks, mergeability and all inline review threads inspected.
- [ ] No unresolved required checks, unless a separate authorized disposition is recorded.

Until these are true, this file is a **queue/plan**, not a completed cross-PR review.

## Review protocol after entry

1. Inspect the four PR heads, diffs against `main`, changes since contributor review,
   status checks, reviewers and issue acceptance criteria.
2. Review each PR individually for broken links, missing documentation and unsupported
   claims. Confirm KAN-4's tool fixes, KAN-5's whitespace-only scope, KAN-6's declared
   manual vs installed workflow boundary, and KAN-7's spec-only/no-run boundary.
3. Examine interactions: overlapping `CLAUDE.md` edits among KAN-4 and other cleanup
   branches; KAN-5's remaining reported findings; cross-links between KAN-6 and KAN-7;
   and the order of future merges if one change invalidates another's head.
4. Record each finding using **path and line, evidence, severity, proposed disposition,
   owner and destination**. Distinguish a real defect from an idea for later work.
5. Keep all findings available here as well as directly on the relevant source PR
   if the Shepherd prefers. Reinspect the source head after any remedial push.
6. Add the Shepherd's observations exactly as supplied. Mark items explicitly
   accepted, returned for amendment, or carried forward with a named owner.
7. **Leave this PR a draft** for the Shepherd's own oversight review. Do not
   independently tick `observed`, issue any final seal, or merge the source PRs.

## PR-by-PR observations

### #468 / KAN-4

**Current head at review:** pending refresh  
**Review finding(s):** pending  
**Owner disposition / evidence:** pending  

### #476 / KAN-5 batch 1

**Current head at review:** pending refresh  
**Review finding(s):** pending  
**Owner disposition / evidence:** pending  

### #469 / KAN-6

**Current head at review:** pending refresh  
**Review finding(s):** pending  
**Owner disposition / evidence:** pending  

### #470 / KAN-7

**Current head at review:** pending refresh  
**Review finding(s):** pending  
**Owner disposition / evidence:** pending  

## Cross-PR interactions and merge-order risks

**Finding(s):** pending joint review  
**Proposed actions:** pending  
**Shepherd ruling:** pending  

## Oversight notes from the Shepherd

This is deliberately open. The Shepherd may add comments to this draft PR or updates
to its branch; copy them into this section as evidence is checked. Do not turn an
unresolved observation into an implicit approval.

**Observation(s):** pending  
**Status:** open, not certified  
**Independent oversight completed:** **no**  
**Final seal authorized:** **no**  
**Merge authorized:** **no**

*Custos keeps the record; the Shepherd makes the final decision.*
