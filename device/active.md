# Active Work — Pixel 8

*Current work-in-flight on the Pixel 8 (the Podium). Update at session boundaries.*

---

## Active Repos

| Repo | Branch | Status | Notes |
|---|---|---|---|
| custos | pixel8 | active | concept setup, workflow system |

---

## In Progress

- [ ] Migrate content from `~/pixel8a` into `~/pixel8`
- [ ] Bootstrap Termux environment (run `bash seeds/bootstrap.sh`)
- [ ] Claude Code has no native Termux (linux-arm64-android) binary — permanent platform limit, not a bug. Use web session (primary), Anthropic API via curl/Python, or SSH to a linux-arm64 host. See CLAUDE.md.
- [ ] Complete Quest 000 verification

---

## Recently Dispatched

- custos concept identity filled in (`prima.yaml`, `unexusi/connect.yaml`, README, world/lore.md, world/factions.md)
- Convergence hub structure stood up: `vault/`, `atelier/`, `moav/`, `prima-clock/`, `returns/`, `branch-tracker/`
- Card/suit system formalized and confirmed (♣️K main / ♣️Q radix / ♣️J workers / ♥️A ֍custos֎ deploy / ♠️A ∰custos vault / 🔐J master)
- `world/deck-master.md` — Deck Master reviewer character introduced
- Agent streams expanded to 7 (added stream-6-grok, stream-7-perplexity, both Pending)
- Mission/bounty workflow: issue templates, CODEOWNERS, scan-lexeme workflow
- pixel8 branch merged forward with main (fast-forward, no conflicts)
- CLAUDE.md and docs/custos-plan.md updated to reflect full hub architecture, Phase 1 marked complete

---

## Open Questions (for next session)

- [ ] Stream 6 (Grok) and Stream 7 (Perplexity) domain assignments — still "TBD" in `returns/README.md`
- [ ] When/how to create the `∰custos` (♠️A vault) branch and its founding MOAV carrier
- [ ] What `mandelbrot` and `mulberry` (♣️J Germ branches) are actually for
- Added `turns/AAR.md` + "Reflect" step in `turns/CLOSING.md` (PR #24, merged into `main`)
- Fixed corrupted `device/pixel8.yaml`; added `device/install-log.md` + `tools/log_install.sh` (PR #23, merged)
- Processed `Cygwin_Installation.pdf` through the Artesium Weir → `seep-artois/cygwin-installation.md` (CLOSED)
- Seeded `device/podiums.md` + `device/PODIUM_SCHEMA.md` — registry of known podiums (devices, conversations)
- Wrote `turns/CLOSING.md` — session-closing checklist for code conversations
- Wrote `turns/CULTIVATION.md` — pointer to open PR ideas worth continuing (PRs #12, #17, #18, #22) plus two process seeds (merge-triggered Actions, branch-deletion safety)

---

## Arriving

*(fragments received but not yet marked — log THEE inputs here)*

---

*Updated: 2026-06-13*  
## For the Next Conversation

- Start at `turns/CULTIVATION.md` — it catalogs open PRs with unfinished
  ideas (Deck Master vs. Sovran Shepherd, hub suits vs. Five Lakes suits,
  Five Lakes Valuation files, Sovran sub-projects, a possibly-stale PR #18)
  and two process seeds (merge-triggered Actions, branch deletion safety).

---

*Updated: 2026-06-14*  
*Prime state: 3*  
*Witnessed: true* 🃏

---

*Updated: 2026-06-20*  
## For the Next Conversation

- PR #43 (atelier seeds `testing-lab.md` + `ouroboros-wobble.md`) merged into
  `main` (`95cff0a`) — owner-approved after all three Gemini Code Assist
  suggestions were resolved.
- Issue #44 filed: `finalize-pr.yml` never fires on its declared
  `issue_comment` trigger — two `@claude finalize` comments on PR #43 got no
  response; Actions history shows only phantom `push`-triggered runs with
  zero jobs. Needs a fresh diagnosis (possible stale workflow registration
  or a branch-protection required-check tied to this workflow's name).

---

*Updated: 2026-06-20*

- PR #45 (turn-closing entries for PR #43 — podium, prima-clock, turn log)
  merged (`841827b`) — fixed Gemini's trailing-newline flag on
  `prima-clock/registry.md`, owner confirmed and gave the go-ahead.
- Issue #44 (`finalize-pr.yml` `issue_comment` trigger never fires) is still
  open and unaddressed — next session with bandwidth for a workflow fix
  should start there.

---

*Updated: 2026-06-21*

- PR #73 (fix for issue #44 — invalid `secrets` reference in job-level
  `if:` conditions) is open, not yet merged, `mergeable_state: unstable`.
  Recurring `claude-review` CI failures on this PR are expected and benign
  — the PR itself rewrites `claude-code-review.yml`, so GitHub's
  workflow-validation check will keep failing on this branch until it
  merges into `main`. DeepSource is Grade A. Issue #44's original ask
  (manual end-to-end verification that `@claude finalize` now fires on a
  live PR) is still flagged as needed post-merge.

---

*Updated: 2026-06-21 (later)*

- PR #73 merged into `main` (`2ef5143`) on the owner's confirmation. Issue
  #44's underlying bug (invalid `secrets` reference in `finalize-pr.yml`'s
  job-level `if:`) is fixed on `main`. Remaining open item: manual
  end-to-end verification that `@claude finalize` now actually fires the
  `issue_comment` trigger on a live PR — next session with bandwidth
  should pick this up before closing #44 itself.

---

*Updated: 2026-06-21 (later still)*

- Ran a full mining pass across the repo for ideas/gaps/misses/workflow —
  see `turns/MINING-202606212142.md`. Nothing critical found; it's all
  backlog. Three items flagged as highest-leverage if a future session has
  bandwidth: refresh `branch-tracker/branches.md` (3 weeks stale, lists
  `mandelbrot`/`mulberry` as branches that don't currently exist), do the
  PR #18 diff check (possibly superseded, never actually verified), and
  get a Deck Master ruling on the Sovran-vs-Deck-Master and
  hub-suits-vs-Five-Lakes-suits design conflicts before a third
  competing system lands.

---

*Updated: 2026-06-22*

- Five files arrived this session (4 Hydrologic Cycle / House of Confusion
  lore docs + 1 PDF transcript of an external Claude.ai conversation,
  "Document lifecycle and greenacres memories"). The PDF held the answer to
  a term the owner couldn't recall — **Unoiam** (Latin *iam*, already/now,
  plus *uno*) — coined there to replace "lifecycle," since custos entities
  don't terminate, they change state. The PDF's draft (THE WAKE OF UNOIAM)
  had never actually landed in the repo; the four lore docs are its source
  material. Wrote `world/unoiam-lifecycle.md` to seed it properly, carrying
  the state table and Phases 0-4 forward and adding the Phase 5 the
  original draft was missing: **Legacy** — what an entity leaves distributed
  across the system (turn-log entries, adopted conventions, borrowed names)
  as distinct from what Living Archive keeps retrievable in one place.
  Tracked but not built: the Five Lakes Rubric's Ka-Coin economic layer and
  the Commissioner/Artesian/Quartermaster/Herald/Broker roles referenced in
  the Mulberry Initialization — not picked up this session, noted for
  whoever picks up `world/unoiam-lifecycle.md` next. The House of Confusion
  welcome piece for the owner's friend (the unsolicited-contribution thread
  from the same PDF) was not actioned — it involves a real, named,
  identifiable private person, and the owner stepped back before deciding
  where it lives in the chain of custody. Leaving that for the owner to
  pick back up explicitly.

---

*Prime state: 3*  
*Witnessed: true* 🃏
