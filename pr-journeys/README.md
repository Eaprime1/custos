# pr-journeys

Presentation-ready records of finalized PRs. Each document captures the full story of a PR's life in the system.

**Written automatically** by `finalize-pr.yml` when `@claude finalize` is triggered and all gates pass.  
**Never edited directly** — they are custody records.

## Naming

```
YYYYMM_PR{N}_{slug}.md
```

Example: `202607_PR238_seed-conatus-primus-prima-wobble.md`

## Structure

Each journey document contains:

- **Header** — repo, prima-clock, branch, author, state
- **Intent** — what the PR set out to do (from PR body)
- **What Arrived** — what actually happened (from PR body)
- **Resonance** — the one-word quality (from PR body)
- **The Arc** — timeline table: opened → finalized
- **CI Record** — all check runs and their results
- **DeepSource Record** — passed / failed / skipped (if configured)
- **Review Scores** — Correctness / Consistency / Scope / Verification (auto-scored)
- **Ethics Check** — checkbox state at finalize time
- **What Door Does This Open?** — the next chamber (from PR body)

## Triggering

```
@claude finalize    # on any PR comment — seals and writes the journey doc
@claude check       # pre-check — reports gate status without sealing
```

## Gates

Finalize will not proceed until:
- Intent, What Arrived, and Resonance sections are filled in the PR body
- All review threads are resolved
- All CI checks have passed (no failing or pending)

---
∰🌿 custos · the record lives in the system
