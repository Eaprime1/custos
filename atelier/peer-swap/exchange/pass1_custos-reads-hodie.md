# Pass 1 — custos reads hodie (cold read)

`prima-clock: 202610152319` (UTC)
`suit: ♦️ Seed · plank: Germ — a working record, not canon`
`entity: eaprime1 + Claude (Sonnet 5.5), custos side of the peer swap`
`status: FROZEN at commit. Corrections go in later passes as new text.`
`reads: eaprime1/hodie, origin/main at a834602 (712 files), read from a clean export of that commit`

*Observations only. No recommendations; those belong to Pass 3.*

---

## 0. What I read, and what I did not

**Read.** `eaprime1/hodie` `main` at `a834602`, exported with `git archive` into a scratch folder
so nothing in hodie's working tree or branches coloured the read. I opened `README.md`,
`HODIE.md`, `NAVIGO.md`, `INVENTORY.md` (heads), `PLEXUS_SYSTEM.md` (head), `CLAUDE.md`,
`CHANGELOG.md` (head), `.sovran/identity.md` (head), `.streams/README.md`, `.eric/README.md` and
`.eric/BACKLOG.md` (heads), `docs/FOOTER_WITNESS.md` (head), `moav/README.md` and every carrier's
stamp and custody fields, `branch-tracker/branches.md` (head), `wellspring/README.md` and
`wellspring/queue.md` (head), `mission/` (listing, two stubs, the triadic seed head),
`_CONSOLIDATED/` (listing, `DEDUPLICATION_LOG.md` head), `pr-journeys/` (one journey head),
`quepad/` (README head, `state.json` summary), and the heads of five workflows
(`claude-code-review`, `finalize-pr`, `auto-finalize`, `footer-witness`, listing of all 15).
I ran `python3 -m pytest tests` in the scratch copy, and `grep`/`find` counts. I did not run the
crawler, the scanners or any hodie script other than the tests.

**Not seen.** Git history (the export has none; the shallow clone shows one commit), PRs,
issues, Actions runs and CI results, every branch other than `main`, any content inside
`_CONSOLIDATED/` (310 files) or `wellspring/` (114 files) beyond names, `quanta/` content beyond
names, `redundancy_entity/`, `crawler_pixel8/` source (listed, not read), `.scripts/` content,
`.claude/` content, and the other branches' peer-swap files.

**Not a cold read, in four ways. Weigh the rest of this file with these in view.**

1. This conversation was the hodie side first. Earlier today I read `eaprime1/custos`, wrote a
   hodie-side Pass 1 (on hodie `feature/peer-swap-hodie-side`) and pushed it. That file is a read
   of custos, not of hodie, and I did not reopen it. I have not read the other hodie-side Pass 1
   (`feature/peer-swap-hodie-side-b`).
2. Before this pass I had already seen hodie's `CLAUDE.md`, a top-level `ls`, the remote branch
   list, the heads of `footer-witness.yml` and `HODIE.md`'s last lines, and the `.github/` listing.
3. I had read custos's own account of hodie: `atelier/hodie-shadow/202610152017_renovata-opening.md`,
   `atelier/peer-review/202610_custos-pixelator_run-0.md`, `atelier/element-of-the-day/hodie-handoff.md`
   and the head of `docs/peer-review-process.md`. Where a custos claim is checked against hodie `main`
   below, I say so.
4. This session is attached to a claude.ai Project named "custos", whose description carried
   custos's architecture and vocabulary.

---

## 1. Shape

- **O1. Four self-descriptions.** `README.md` (dated 2025-12-24, v0.1.0): "staged processing pipeline
  that prevents crawler overload". `HODIE.md`: "a living workshop… Workshop Pinnacle Entity", elevated
  20260425. `.sovran/identity.md`: "the daily witness… Hodie holds now". `NAVIGO.md`: "the universal
  workshop layer", session 2026-04-14.
- **O2. Counts.** 712 files. By top-level folder: `_CONSOLIDATED/` 310, `wellspring/` 114, `quanta/` 54,
  `.scripts/` 29, `.eric/` 27, `redundancy_entity/` 19, `moav/` 18, `.github/` 18, `crawler_pixel8/` 17,
  `.claude/` 14. 248 `.md` files and 59 `.py` files. Content outweighs code by a wide margin.
- **O3. Tests.** `tests/` has 7 files. In the scratch copy, `pytest` with `pytest-asyncio` installed
  (declared in `pyproject.toml` lines 35 to 36, `asyncio_mode = "auto"` at line 71): 88 passed. Before I
  installed it, 25 async tests failed with "async def functions are not natively supported". So the
  tests pass, and they need a dev dependency that `CLAUDE.md` does not list ("standard library only").
- **O4. Workflows.** 15 files in `.github/workflows/`: `auto-finalize`, `claude-code-review`,
  `finalize-pr`, `footer-witness`, `gemini-dispatch`, `gemini-invoke`, `gemini-review`, `gemini-triage`,
  `notify-repeated-failure`, `pr-readiness`, `pylint`, `python-package-conda`, `sovran-voice`,
  `sync-hodie`, `workflow-lint`.
- **O5. What hodie does not have.** No `LICENSE*`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`,
  `.github/ISSUE_TEMPLATE/` or PR template (`ls`). custos's own hygiene run (`atelier/peer-review/202610_custos-pixelator_run-0.md`)
  reported hodie at 3 of 13 against the baseline; this is consistent with that, but I counted
  only the five I listed.

## 2. Process the repo enforces

- **O6. The paid review is rationed, as of today.** `.github/workflows/claude-code-review.yml`
  header: runs once on `opened`, `ready_for_review`, and on the `ai-review` label; the comment
  records that before `202610152203` UTC it also ran on every `synchronize` and `reopened`, drafts included,
  and says "Pattern adapted from custos". `pr-journeys/202610_PR164_ci-claude-code-review-once-on-ready-not-.md`
  records the change, with the note "The first small thing hodie takes from the peer, before the swap starts."
  (custos's Renovata document, written at 202610152017, says hodie had no draft skip. That was true
  when written and is stale on `main` now.)
- **O7. Sealing.** `.github/workflows/finalize-pr.yml` header: `@claude finalize` seals; allowed
  commenters OWNER/MEMBER/COLLABORATOR/bot; gates are template sections, threads, CI. It does not
  mention the Latin cue, a footer-comment guard or a quoted-cue guard in the header lines I read.
- **O8. Bot PRs can be sealed without an owner comment.** `.github/workflows/auto-finalize.yml`
  header: every hour and on check-suite completion it finds open bot-authored PRs that are over an
  hour old, unlabelled `finalized`, with every gate green, "then finalizes them directly".
- **O9. Provenance by footer, with state.** `.github/workflows/footer-witness.yml` plus
  `scripts/footer_witness.py` check for `∰` followed by a 17-digit timestamp (`docs/FOOTER_WITNESS.md`:
  "additive, always additive"). The scan writes `quepad/state.json` (170 known files, 24 marked
  compliant, `last_scan` 20261015221326522), and a bot commits the refresh: the tip of `main`
  is "quepad: refresh witness scan state [skip ci]" by `github-actions[bot]`. My own count: 23 of
  248 `.md` files carry a `∰` plus a 17-digit stamp (regex `∰ *[0-9]{17}`).
- **O10. Retention.** `branch-tracker/branches.md` states a "Mobius-Closed branch retention policy
  adopted 2026-08-21": branches are never deleted, and "finished" is recorded in the tracker instead.
  Its baseline is `origin/main` at `373dcd9` (2026-08-21).
- **O11. Records of PRs.** `pr-journeys/` holds three journeys and a README. The PR164 journey
  has Intent, What Arrived, Resonance and The Arc sections.

## 3. The custody trail

- **O12. MOAV carriers.** 17 JSON files in `moav/`. All 17 carry a `prima_clock` and a
  `chain_of_custody`, and all 17 say `OPEN`, including `hodie_moav_transfer_gravity_core.json`,
  whose `motion_state` is `COMPLETE`. 16 are duplicate-consolidation candidates (stamps
  `202608212008` to `202608212055`); one is a transfer (`202608220615`).
- **O13. The index is current.** `moav/README.md` lists all 17, with a status for each, and says:
  "All of the above are CANDIDATE/OPEN, not formally closed — eaprime1 approved the *format*…
  but has not yet reviewed each individual consolidation."
- **O14. Nothing records hodie's own entry into custody.** No carrier in `moav/` names hodie as
  the entity entering custody. (custos's Renovata document says the same; I checked it against the tree.)
- **O15. A carrier keeps what removal would lose.** `hodie_moav_transfer_gravity_core.json` has
  `from` and `to` repos with commit ids, the method ("Copy, not move"), one file left behind and why,
  and three `open_questions`. `moav/README.md` says removed duplicates' "original path, link, icon,
  any award" are "preserved in the carrier rather than lost".
- **O16. Tombstones.** `mission/BRANCH_STRATEGY.md` and `mission/NAVIGO.md` are 8-line stubs: "kept as a
  historical record for path continuity", naming the removal commit `f86aa55` and the canonical root file.
  `mission/PLEXUS_SYSTEM.md` and `mission/PRIME_2026_DEVELOPMENT_PLAN.md` differ from their root copies;
  I did not open them.

## 4. Intake and holding

- **O17. Several holding places.** `wellspring/` (114 files), `_CONSOLIDATED/` (310), `_SORTING/` (2),
  `_TODAY/inbox/` (4 files plus `.gitkeep`), `quepad/`, `.eric/` ("External Creation Requests", 27 files),
  and `.streams/` (one README).
- **O18. The wellspring states a rule its contents do not show.** `wellspring/README.md`: "Head
  pressure: 1 item at a time", and "This is **not** a dump folder." The folder holds 96 PDFs, 16 `.txt` and
  2 `.md`: `Temphold_needs_review/` 89 files, `CODEX_fragments_needs_review/` 16, root-level PDFs 7.
  `wellspring/queue.md` (77 lines) is the ordered list, with destination "pending eaprime1 review".
- **O19. Dedup is logged.** `_CONSOLIDATED/DEDUPLICATION_LOG.md` (2026-01-02) records, per document,
  the files found and the diff result.

## 5. Where custos appears in hodie

- **O20.** `HODIE.md` has "The Custos Compact": Custos is "the host entity of THE hodie",
  with three roles (guardian, shepherd, husbandry); a last line `∰ 20260720061500002` glosses it.
- **O21.** `mission/TRIADIC_ENTANGLEMENT_CUSTOS_HODIE_RADIX.md`: "Status: Seed — captured, not yet fully
  worked." Maps custos, hodie and radix to proton, neutron and electron.
- **O22.** `moav/README.md` says the naming convention is "Adopted from custos's `moav/README.md`";
  `hodie_moav_transfer_gravity_core.json` reuses custos's suit taxonomy and names it.
- **O23.** `.scripts/env_setup.sh` exists (custos's `CLAUDE.md` says its own copy was ported from it).
  `.locations/` holds `mulberry`, `pixel8a` and `codespaces`.

---

## 6. What confused me

- **C1. Folders described and absent.** `README.md`, `INVENTORY.md` and `PLEXUS_SYSTEM.md` each draw
  a tree of `plexus/` (with stages), `duplicatus/`, `exemplar/`, `gravitar/` and `rudera/`. None exists in
  `main` (`find . -iname 'plexus*' -o -iname 'rudera*'` finds only `PLEXUS_SYSTEM.md` and its `mission/`
  copy). `moav/README.md` says `duplicatus` and `gravitar` are separate repos. `INVENTORY.md` gives a device path
  (`/storage/emulated/0/pixel8a/Q/hodie`) as the location.
- **C2. The stage list changes between documents.** `README.md`: simplex, duplex, triplex, quadroplex,
  uniplex, multiplex, omniplex. `NAVIGO.md`: simplex, duplex, triplex, quadroplex, quintoplex, multiplex,
  omniplex.
- **C3. `CLAUDE.md` against the tree.** It names `.github/workflows/claude.yml` ("Claude Interactive");
  there is no such file among the 15 workflows. It says `quanta/` has "16 entity domains"; I count 15
  directories. It says "standard library only for core"; the tests need `pytest-asyncio` (O3).
- **C4. Whether the wellspring is a queue or a store** (O18): "1 item at a time" beside 114 files.
- **C5. What `OPEN` means on a finished carrier** (O12). custos uses the same word on carriers of every
  state (for example its own founding carrier), so I do not read this as a hodie error. I note that two repos now
  share a field whose value does not vary.

## 7. A promise I cannot find evidence of

**The plexus.** `README.md`, `PLEXUS_SYSTEM.md` and `CLAUDE.md` ("Plexus Stages: Content moves through
processing stages") describe content moving from sort and today folders through stage folders so "the
crawler only sees active work". Where I looked: the top level of `main`, a `find` for `plexus*`, `simplex*`
and `rudera*`, `crawler_pixel8/` (listing only), `crawler_output/` (`consolidated_crawl_summary.json`,
`summaries/.gitkeep`). I found the vocabulary in `README.md`, `INVENTORY.md`, `PLEXUS_SYSTEM.md`, `NAVIGO.md`, `CLAUDE.md` and `.sovran/identity.md`, and I found
no stage folder and no record of a file passing through one. I did not read the crawler source, so the
pipeline may exist in code without the folders.

## 8. Through other eyes

- **The newcomer who has never seen either repo.** `README.md` is the first file and is dated 2025-12-24; its
  folder tree is absent (C1). `HODIE.md` reads better as an entry, but brings a dense vocabulary (rivulus,
  amnis, rivus, flumen, torrens) without a glossary that I found. `CLAUDE.md` has the clearest practical map,
  with the mismatches in C3.
- **A contributor with no context who wants to help today.** `CLAUDE.md` gives commands (`pylint`,
  `python3 crawler_pixel8/cli/test_crawler.py`) and the tests pass with the declared dev dependency. There
  is no `CONTRIBUTING.md`, issue template, PR template or licence (O5), so I could not find what a
  contributor is asked to do or may claim.
- **The Shepherd on a tired day.** Helps: `.eric/BACKLOG.md` ("items not forgotten, waiting for their
  cycle", last updated 2026-04-10), session-note scripts in `.scripts/`, a branch tracker. Hurts: the backlog is
  six months old, and two large holding areas (O17, O18) have no visible owner of the next step beyond "eaprime1
  review". I did not time a re-entry.
- **The repo six months from now, if nothing changes.** My guess, not evidence: the bot's witness-refresh
  commits keep landing at the tip of `main`, the 16 carriers stay `OPEN`, the wellspring queue stays as it is,
  and the plexus folders stay described and absent.

## 9. Lens (Quince)

Left unanswered. I found no definition of Quince; custos's own review of its halide seeds
(`atelier/halide/seeds/REVIEW-202610030124.md`) says it is not in the repo. I would be inventing the lens.

---

∰◊€π¿🌌∞
