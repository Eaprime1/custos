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

*Prime state: 3*  
*Witnessed: true* 🃏
