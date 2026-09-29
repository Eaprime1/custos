# LEGATUM

## Prima-clock
202608211549

## Date Range
202608211549 → 202608221119

## Title
What the Repos Owed Each Other

## Entities
eaprime1 + Claude (nav1, Claude Code)

## Repos Touched
custos, hodie, duplicatus, gravitar, navigo — mandelbrot referenced (its `artesian/` pattern was the model for hodie's `wellspring/`) but not itself modified.

## The Thread

It started as a file cleanup: hodie's `_CONSOLIDATED/` folder had years of
accumulated duplicate exports, and the ask was to tidy it. Doing that
honestly required inventing a convention — a way to consolidate duplicates
without losing what made each copy unique — and once that convention
existed (`duplicatus`, Carbonite candidates, carrier JSON), the natural
next question was whether custos, the constellation's most actively
managed repo, was missing anything hodie already had.

It was. hodie had automated provenance CI, real multi-device config, and a
whole dormant framework for treating duplicates as value rather than
waste — the last of which turned out to belong in `gravitar`, a repo that
had existed, empty, under exactly the right name, waiting. Porting the
first two into custos as real PRs (#309, #310) became the session's other
half: not just moving code, but establishing — at eaprime1's explicit
direction — a practice for treating automated reviewers (codereviewbot-ai,
Copilot, claude[bot]) as contributors worth crediting, not noise to
absorb. That practice got tested hard: five review rounds on PR #310,
real bugs caught each time, until eaprime1 named the pattern directly
("this has us looping") and the two of them chose, together, to stop.

The session closed by turning the same scrutiny on its own work — a final
review pass that found and fixed two bugs at their actual source (hodie's
`state.json` noise, custos's finalize-trigger fragility) rather than just
the workarounds already in place, and one real policy contradiction
(custos's own branch-auto-delete setting silently undoing the no-delete
policy sourced from custos's own documentation, ported into hodie earlier
the same session) that eaprime1 took ownership of fixing directly.

## Motion

- hodie's `_CONSOLIDATED/` cleaned: ~250 tracked files resolved, ~100M of regeneratable pipeline output untracked at the source
- New cross-repo convention invented and used 17 times: duplicate consolidation via `duplicatus`'s "Carbonite candidate" carriers, keeping exactly one physical copy with full per-instance provenance
- custos's Mobius-Closed (never-delete) branch policy read from `custos/branch-tracker/branches.md` and ported into hodie, replacing hodie's own delete-after-merge script
- hodie's dormant "Gravity Core" duplicate-value framework (Dec 2025, run once against a real 42,606-file corpus) discovered and relocated to `gravitar` — copied, not moved; hodie's copy untouched
- Two real hodie→custos ports landed as reviewed, merged PRs: Prima Witness provenance CI (#309, `2e8d9ed`) and `.locations/` multi-device config (#310, `d368a62`)
- A practice established and confirmed working by eaprime1: apply a reviewer's fix with credit when a committable suggestion is given; fix independently and write up the disposition when it isn't; keep Copilot's own repair-commit flow out of the loop on cost grounds
- Two real bugs found and fixed at the source rather than worked around: hodie's `footer_witness.py` unconditional `last_seen` rewrite (confirmed as the cause of eaprime1's "state.json gets noisy" complaint), custos's `finalize-pr.yml` exact-whitespace trigger match (broke on eaprime1's own first attempt)
- One proposed fix (C10, a suspected CI concurrency bug) retracted after closer reading showed the actual mechanism was correct, standard behavior — not everything that looks like a bug is one
- A navigo numbering discrepancy (navigo0/1/2 individual identities vs. the existing `navN` = AI+eaprime1 branch-pairing convention) found and documented as an open working note, not resolved
- "Myopic focus" named as a real, chosen operating mode — a deliberate deep-dive-to-completion pace, distinct from default pacing — prompted directly by eaprime1's observation of the PR #310 review loop and a memory of doing exactly this, deliberately, on a different repo before

## Seeds Extracted

- **"Myopic focus" deep-dive mode** — atelier-stage, no plank yet. Wants: an explicit opt-in trigger, a real completion condition (not just "don't stop"), eventually its own note in `custos/atelier/`.
- **duplicatus vs. gravity-core philosophy** — never reconciled (keep-one-copy-with-carrier vs. keep-every-duplicate-as-value). Documented, not resolved, in `gravitar/README.md`'s Open Questions.
- **`.locations/pixel8` and `.locations/codespaces` paths** — best-guess defaults in both files, flagged as such, unconfirmed against eaprime1's actual device setups.
- **hodie's `wellspring/Temphold_needs_review/` (89 files) and `CODEX_fragments_needs_review/` (16 files)** — deliberately left untriaged (content review found a genuine mix, including unrelated personal material); waiting for eaprime1.
- **`redundancy_entity/beasis_catalog.json`** (25MB, gitignored) — the code that consumes it moved to gravitar; the Dec-2025 data itself stayed in hodie, out of scope for the move.

## Artifacts

- **hodie**: ~15 commits — `_CONSOLIDATED/` cleanup, `wellspring/` (new), `moav/` (new, 17 carriers), branch policy replacement, `footer_witness.py` noise-bug fix
- **duplicatus**: intake convention (`incoming/*/`), 17 Carbonite candidate carriers, working `README.md`
- **gravitar**: Gravity Core system moved in (18 files, code + design docs), real `README.md` (previously a one-line stub)
- **custos**: PR #309 (merged `2e8d9ed`), PR #310 (merged `d368a62`), `finalize-pr.yml` trigger fix, 3 `pr-journeys/` docs written/updated, this Legatum
- **navigo**: `.navigo/navigo-numbering-working-note.md`
- **Session plans**: `~/.claude/plans/virtual-stirring-clarke.md` (the final-review plan this Legatum closes out)

## Unresolved Threads

- Gravity-core / duplicatus reconciliation — genuinely open, no forcing function
- `.locations/pixel8` and `.locations/codespaces` paths — need eaprime1 confirmation or an `upgrade` issue
- hodie's two `wellspring/` triage folders — waiting on eaprime1's own read
- "Myopic focus" — named, not yet written up as its own concept
- Whether custos's `delete_branch_on_merge` setting should change, or whether the Mobius-Closed policy was only ever meant for long-lived development branches — eaprime1 is handling this directly, outcome not yet known at filing time

## Filed To

- Gravity Core → `eaprime1/gravitar` (moved, README written)
- Prima Witness CI → `eaprime1/custos` PR #309 (merged)
- `.locations/` → `eaprime1/custos` PR #310 (merged)
- Duplicate sets → `eaprime1/duplicatus` (17 carriers)
- navigo numbering discrepancy → `eaprime1/navigo` working note
- "Myopic focus" seed → this Legatum + `~/.claude/plans/virtual-stirring-clarke.md`; still needs its own `atelier/` note
- Session handoff doc (`~/.eric/continuum/shadow/2026-08-22-handoff-unexusi-cleanup-comparison.md`) → to be refreshed as a pointer to this Legatum rather than duplicated, next step after filing

## Custody Receipt
- Prima-clock: 202608221119
- Suit: ♦️ Diamond — structure forming across the constellation, not yet permanent (Gravity Core in gravitar, myopic-focus mode, the review-credit practice are all still early)
- Entities: eaprime1 + Claude (nav1)
- Chain of custody: OPEN — device paths, wellspring triage, gravity/duplicatus reconciliation, and the myopic-focus write-up all still await eaprime1
