# Peer Swap — Form: custos side (filled)

`prima-clock: 202610152319` (UTC; copied from `atelier/peer-swap/form-custos-side.md` at `a8e9e41`, filled by the custos side)
`you hold: eaprime1/custos · you are reading: eaprime1/hodie`
`status: Sections A and B filled (Pass 1). C to F blank; they fill in as the passes land.`

---

## A. Baseline — before you read anything

1. Where I am running: Claude Code in a cloud container (Sonnet 5.5), attached to a claude.ai Project named "custos".
2. What I can read: `eaprime1/hodie` yes (`main` at `a834602`, remote branch list, other branches by fetch) · `eaprime1/custos` yes (branch `navigo-claude-hodie-custos`, `a8e9e41`, shallow).
3. What I can write: `eaprime1/custos` by shell and git, branch `peer-swap/custos-side` (created from `navigo-claude-hodie-custos`). A real push is proven only once it lands. Opening a PR is probably not possible from here (`gh` token invalid, no GitHub PR tool loaded); if so, Eric opens it from text I supply.
4. What I already knew about `eaprime1/hodie` before Pass 1: not cold. This conversation began as the hodie side, so I had seen hodie's `CLAUDE.md`, a top-level `ls`, the remote branch list, the `.github/` listing and the head of `footer-witness.yml`; and I had read custos's own documents about hodie. Full list in `pass1_custos-reads-hodie.md` section 0.
5. What I already knew about `eaprime1/custos`: a good deal. I read it earlier as the hodie side (`CLAUDE.md`, README, registry, vault, moav, turns, tools, workflows) and the Project description carries its architecture.
6. Anything I cannot reach: hodie history, PRs, issues, Actions runs and CI results (shallow, no working `gh`); the contents of hodie's `_CONSOLIDATED/` and `wellspring/` beyond names; the other hodie-side conversation's Pass 1 (not read, on purpose).

---

## B. Pass 1 — cold read of `eaprime1/hodie`

Full observations with citations are in `atelier/peer-swap/exchange/pass1_custos-reads-hodie.md` (frozen). Short answers:

1. In one sentence, what `eaprime1/hodie` is for: a workshop repo where content is staged and consolidated and witnessed (`HODIE.md`, `README.md`), with a Python crawler (`crawler_pixel8/`, tests pass) and a very large body of content (`_CONSOLIDATED/`, `wellspring/`, `quanta/`).
2. Three things it does that I would have missed in my own repo:
   - A deduplication carrier that preserves what removal would lose, with a log (`moav/hodie_moav_transfer_gravity_core.json`, `moav/README.md`, `_CONSOLIDATED/DEDUPLICATION_LOG.md`).
   - A stateful witness scan with a bot refresh commit (`footer-witness.yml`, `scripts/footer_witness.py`, `quepad/state.json`, `docs/FOOTER_WITNESS.md`).
   - Tombstone stubs that name the removal commit and the canonical path (`mission/BRANCH_STRATEGY.md`, `mission/NAVIGO.md`); and a never-delete branch rule with a tracker (`branch-tracker/branches.md`).
3. Three things that confused me: folders described in `README.md`, `INVENTORY.md` and `PLEXUS_SYSTEM.md` that do not exist (`plexus/`, `rudera/` and others); four documents that each say what hodie is, in different words and with different stage lists; `CLAUDE.md` naming `claude.yml` (absent) and 16 quanta domains (15 present). More in the pass file, section 6.
4. One thing it seems to promise that I cannot find evidence of: content moving through plexus stages. Looked at the top level, a `find` for stage names, `crawler_pixel8/` (listing) and `crawler_output/`. Found vocabulary in six files, no stage folder and no record of a file passing through one. I did not read the crawler source.
5. With ten minutes, I would open `moav/README.md` first and `.github/workflows/claude-code-review.yml` second: the first shows what hodie actually records and what is still open; the second shows the first thing hodie took from custos, with the date.

**Through other eyes:** see section 8 of the pass file. Short form:

- The newcomer who has never seen either repo: `README.md` is dated 2025-12-24 and draws absent folders; `HODIE.md` reads better but its vocabulary has no glossary I could find.
- A contributor with no context, who wants to help today: commands and passing tests exist; no `CONTRIBUTING.md`, issue template, PR template or licence, so the ask is unclear.
- The Shepherd on a tired day: session-note scripts and a backlog exist, but the backlog is dated 2026-04-10 and two large holding areas wait on review. I did not time a re-entry.
- The repo six months from now, if nothing changes (a guess): bot witness commits at the tip, carriers still `OPEN`, the wellspring queue unchanged, plexus folders still described and absent.

**Lens (Quince):** unanswered. No definition found; custos's own `atelier/halide/seeds/REVIEW-202610030124.md` says it is not in the repo.

---

## C. Pass 2 — deep dive of `eaprime1/custos`

*Full text: `pass2_custos-own-repo.md` (frozen). Summary of each answer:*

1. Top-level folders: see Pass 2 section 1 (load-bearing / finished / unfinished / generated / unknown).
   - `quests/`, `world/`, `tools/`: finished or near-finished; `world/the-the.md` do-not-edit; 22 tools, tests pass.
   - `prima-clock/`, `moav/`, `vault/`, `branch-tracker/`: registry 40 rows, 13 carriers (README indexes 5), vault empty, tracker 12 days behind.
   - `atelier/`, `.shadow-well/`, `queue/`: unfinished by design; `atelier/` 142 files, mostly unread by me.
   - `turns/`: five files, five jobs; five PR observations.
   - `.github/workflows/`: 25 workflows; `CLAUDE.md` names nine.
   - Not listed: `pr-journeys/` (115, generated), `dungeon-master/`, `valuation/`, `guides/`, `docs/`, `missions/`, `device/` and others: present, state not judged.
2. Corrections to Pass 1: K1–K8 in Pass 2 section 2 (`device/` on `main`; witness counts not comparable; four tracker branches absent; registry row `202609251844` outlived its tree; stale "Known Stray Content"; 48 lines vs 40 rows; five workflows differ from hodie's; bounty remnants).
3. Things hodie would not guess: Pass 2 section 3 (exceptions as registry rows, seal and merge as two acts, rationed paid review, workflow-enforced no-cash rule, five session-memory files, `peer_inventory.sh`, empty vault by design).
4. Least like the peer to open: `CLAUDE.md` and `branch-tracker/branches.md`, because both state things the tree no longer matches.
5. Did it change how I read Pass 1: yes. Custos has the same four faults I listed for hodie; only the way of stating staleness differs (Pass 2 section 5).

*Disclosure: after gathering facts I read hodie session A's Pass 1. Not the letter. Not session b.*

---

## D. Pass 3 — letter to `eaprime1/hodie`

*Full text: `pass3_letter_custos-to-hodie.md` (frozen). Header says hodie's letter had NOT been read.*

1. Seen in hodie: plexus described and absent; `CLAUDE.md` against the tree (`claude.yml`, 15 vs 16, `pytest-asyncio`); all 17 carriers `OPEN`; no contributor door; wellspring "1 item at a time" beside 114 files.
2. Borrow table: carrier transfer fields (adopt), current carrier index (adopt), Mobius-Closed retention (adapt), tombstone stubs (adapt), footer stamp state and bot commit (decline; "additive" rule maybe adapt). Costs are in the letter.
3. Questions: plexus code vs folders; `claude.yml`; meaning of `OPEN` on `COMPLETE`; draft handling in `auto-finalize`; owner of the wellspring next step; Quince.
4. Warnings: custos `CLAUDE.md` stale in four places; "ported" is not shared; seal convention is heavy; `pull_request_target` workflows; empty vault; naming under review; bounty remnant.

*Peer's letter on origin before Pass 4: not checked. I have not read it.*

---

## E. Pass 4 — reply to the peer's letter

1. For each item in the peer's letter:

| Their item | adopt / adapt / decline | Reason | Where in my repo | Done in this PR, or follow-up |
|---|---|---|---|---|
| ____ | ____ | ____ | ____ | ____ |
| ____ | ____ | ____ | ____ | ____ |
| ____ | ____ | ____ | ____ | ____ |

2. Small adaptations made in this PR (paths): ____
3. Follow-ups named but not done: ____
4. What changed my mind, if anything: ____

### Custos-side block

5. How custos would record hodie's prima-clock stamp once Eric sets it (registry row, MOAV
   carrier, both?), with the fields I would use: ____
6. What custos would need from hodie to treat its entry as custody and not only as a note: ____
7. Which parts of custos' conventions would not travel to hodie without rewriting, and why: ____
8. One thing hodie does that custos lacks, and what it would cost to adopt: ____

---

## F. Ready for oversight

- [ ] All four passes committed; Passes 1 to 3 frozen
- [ ] This form complete; unanswered blanks marked and explained
- [ ] My repo's own scan run: ____ (result)
- [ ] PR description follows my repo's template; PR marked ready for review
- [ ] One comment posted in words saying the PR is ready, and what is left open
- [ ] I have not sealed, merged, or edited the peer repo

---

∰◊€π¿🌌∞
