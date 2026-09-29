# Submission Pipeline — Custody Ledger

<!-- append-only — mark stage transitions, never delete rows -->
<!-- stages: claimed → pr_open → reviewed → approved → merged → followup → closed -->

| ID   | Contributor           | Title                                     | Stage    | Next Action                           | Updated    |
|------|-----------------------|-------------------------------------------|----------|---------------------------------------|------------|
| #38  | dannyward630 / Ojas2095 | J-21 symbol + Lumenar docs              | closed   | J-21 canon established; nullification noted | 2026-06-19 |
| #130 | Rachaelisa            | bounty claim (no PR submitted)            | closed   | Response drafted — awaiting Shepherd send | 2026-06-29 |
| #130 | Ojas2095              | /claim comment (no PR submitted)          | closed   | Superseded by #133                    | 2026-06-29 |
| #131 | SKYJAMES777           | Name drifted lexeme + wobble mechanism    | closed   | Done                                  | 2026-06-23 |
| #132 | SKYJAMES777           | (redundant to #131)                       | closed   | Closed as redundant                   | 2026-06-23 |
| #133 | kabbersokhi-boop      | Develop partner perspective               | followup | PR A: partner_state schema; PR B: ethics | 2026-06-29 |

## #133 Full Journey

```
claimed      2026-06-23 01:35  kabbersokhi-boop /claim on issue #130
pr_open      2026-06-23        PR #133 opened — "Develop partner perspective"
reviewed     2026-06-24        Gemini YAML note; eaprime1 full review
approved     2026-06-24        eaprime1: "all three open threads get a real answer"
merged       2026-06-26        Landed on main; issue #130 closed
followup     2026-06-29        PR A (partner_state schema) + PR B (ethics) named
                               Rachaelisa response drafted
```

## Stages Defined

- **claimed** — contributor posted /claim on an issue, no PR yet
- **pr_open** — PR submitted, review pending
- **reviewed** — feedback posted, changes may be requested
- **approved** — shepherd or reviewer approved, not yet merged
- **merged** — PR landed on main
- **followup** — merged but a named follow-up thread remains open
- **closed** — all threads resolved, no action remaining

## Open Follow-ups

| From  | What                                              | Target               |
|-------|---------------------------------------------------|----------------------|
| #133  | partner_state block → turns/AAR.md               | PR A                 |
| #133  | Ethics foundation + SANF ethics doc              | PR B                 |
| SANF  | Shadow Awareness Navigation Framework — own repo  | Destination TBD      |
| #130  | Rachaelisa response on issue thread               | No PR — comment only |
