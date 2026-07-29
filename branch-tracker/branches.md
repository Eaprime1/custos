# BRANCH TRACKER 🃏

Active development map for eaprime1/custos
Last updated: 202607150601

---

## Hub Structure — ♣️ Club of Kings

The working hierarchy of the convergence hub. Flow direction:

```
♣️J (working) → ♣️Q radix (buffer) → ♣️K main → ♥️A ֍custos֎ (deploy) → ♠️A vault
```

| Card | Branch | Role | Status | Notes |
|------|--------|------|--------|-------|
| ♣️K | `main` | Hub default — father of all branches | Active | Tip `551cb8a` as of 202607150601 (PR #200, sparstone docs hub, just merged) |
| ♣️Q | `radix` | Buffer / go-between — working to showpiece | **Stale** | 270 commits behind `main` as of 202607150601. Its 1 unique commit (PR #56, merged 2026-06-22) was itself an attempt to "catch radix back up" — it fell behind again after. Needs a dedicated reconciliation pass; not safe to blind-pull into `main`. |
| ♣️J | `pixel8` | Pixel 8 device (Podium) | Active | 0 unique commits vs `main` as of 202607150601 — currently fully caught up content-wise. Stays a separate branch by design (device state; PRs to `main` require Sentinel review). |
| ♣️J | `mandelbrot` | Working branch | **Not created** | Listed in a prior version of this doc as a germ Jack; no such branch currently exists in the repo. Either never materialized or was cleaned up before this pass — flagging rather than silently dropping the row. |
| ♣️J | `mulberry` | Working branch | **Not created** | Same as `mandelbrot` — no matching branch exists currently. |
| ♣️J | `main-to-radix` | Update path: main → radix | **Not created** | No such branch currently exists. `radix`'s staleness (above) suggests this path, if it ever existed, isn't running. |
| ♥️A | `֍custos֎` | Deploy branch | Active — **just updated** | Fast-forwarded to `main` tip `551cb8a` on 202607150601 (was 277 commits behind, 0 unique content of its own). Deploy is current as of this pass. |
| ♠️A | `∰custos` | Vault pinnacle | Pending | Not yet created — highest custody |
| Pandora | `pandora/primal-seed` | Container branch — collects per-stream germ responses to the Primal Seed document (origin: a Claude Projects conversation) | Germ | First cross-conversation alignment handshake; see `pandora/README.md` |
| 🔐J | `master` | Save point | **Not created** | No branch by this name currently exists. Protected-branch role, if still intended, needs re-establishing or this row retired. |

---

## Concept Development — ♦️ Diamond Branches

Branches developing into separate destination repos.

| Branch | Suit | Status | Destination Repo | Notes |
|--------|------|--------|-----------------|-------|
| milkweed-vectors | ♦️ | Germ | eaprime1/milkweed-vectors | Photo anchors, beetle obs |
| photo-anchors | ♦️ | 1/3 | eaprime1/custos | Protocol in dev |
| diamond-reservoir | ♦️ | Germ | eaprime1/diamond-reservoir | Seed pressure system |
| prima-clock | ♦️ | Germ | eaprime1/prima-clock | Temporal registry |
| 121-architecture | ♦️ | 2/3 | eaprime1/121 | Periodic table expansion |
| valuation | ♣️ | 1/3 | eaprime1/custos | Five Lakes Valuation System — bridge doc landed, ledger crawl in progress |
| `threshold-crossing` (atelier seed) | ♦️ | Germ (atelier) | TBD | First named atelier exit; suit ♦️ Diamond confirmed; Chronicle 0002; destination repo TBD — awaiting eaprime1 routing decision |
| `wordpress` | ♦️ | Germ | WordPress.com — www.unexusi.com ("Phoenix Prism") | Branched from updated `֍custos֎`/`main` at `551cb8a` on 202607150601, per eaprime1 direction. No content yet. WordPress.com MCP connector available in-session but not yet authorized. |

---

## Navigo Branches — Internal Team Contributions

Branches developed by navigo teams (navN = AI model + eaprime1). Internal contributors; same accountability as external, Shepherd can redirect.

| Branch | Navigo | Suit | Status | Notes |
|--------|--------|------|--------|-------|
| `navigo5/granum-anchor-review` | nav5 (ChatGPT+eaprime1) | ♦️ | **Mobius-closed** | PR #179 merged 2026-07-02. Content (anchor-review seed, `.chatgpt/` workspace) fully absorbed into `main`. Branch retained, not deleted — see Mobius-Closed section below. |
| `navigo14/concept-grain` | nav14 | ♦️ | **Mobius-closed, content migrated out** | Single-commit branch (`Add files via upload`, 2026-07-01), carried one file: `🌾 The -Grain- Concept.pdf` — not otherwise integrated into `main`. On 202607150601, the PDF was copied (byte-identical) to `eaprime1/tabularium` at `incoming/concept-grain.pdf`, with a chain-of-custody carrier (`incoming/concept-grain.carrier.json` in tabularium; mirrored in this repo as `moav/custos_moav_transfer_conceptgrain001.json`). This is the first item against tabularium's own noted-but-unstarted ".pdf survey" mission. Branch retained per no-delete policy — the branch itself, not just the file, is the record. |

---

## Journeys — Session Archives

Branches that exist to crystallize a closed conversation into `valuation/`.

| Branch | Suit | Status | Destination Repo | Notes |
|--------|------|--------|-----------------|-------|
| valuation/custos-genesis-journey | ♣️ (Ace candidate, Five Lakes) | 1/3 | eaprime1/custos — `valuation/` | First journey doc; scored 10/10 via Five Lakes rubric; pending Deck Master review |

---

## External Repos — Reference & Destination

Repos this hub routes content to, or draws reference material from, outside the `custos` git tree itself.

| Repo | Relationship | Notes |
|------|--------------|-------|
| `eaprime1/tabularium` | Reference-everything archive; destination for the Crispr-NiE library pipeline | Founded from custos prep work (see Mobius-Closed section — `claude/tabularium-repo-setup-7h5229`). Cloned into this session 202607150601. First cross-repo custody transfer landed same session: `navigo14/concept-grain`'s PDF (see Navigo Branches above). |
| WordPress.com — www.unexusi.com ("Phoenix Prism") | Deploy destination for the new `wordpress` branch (see Concept Development above) | eaprime1 reports the site has been through several rapid iterations, at least one crash/rebuild cycle, over roughly a year. A direct check of www.unexusi.com from this session returned HTTP 403 (blocked, live/down state unverified from here). |

---

## Mobius-Closed Branches

*Per direction: these branches are not deleted as a matter of policy. Their content has fully landed elsewhere (usually `main`, via a merged PR) — the branch itself is retained as the record of the passage, not as a place further work happens. "Finished but not complete": the branch stays open, the work it carried is done.*

| Branch | Carried | Landed via | Prima-clock | Notes |
|--------|---------|------------|-------------|-------|
| `claude/content-review-atelier-hxfedd` | Chronicle 0002 ("The Atelier Door Opens") — finalization journey for PR #185 | PR #185 (merged 2026-07-09) and/or a follow-up not separately tracked here | 202607090827 | 0 unique commits vs `main` as of 202607150601 — fully absorbed. |
| `claude/tabularium-repo-setup-7h5229` | Founding-turn log entry + issues #194-198 filed from tabularium's `CUSTOS_BRIEF.md` | Turn log entry 2026-07-09 00:45; issues filed directly | 202607090045 | 0 unique commits vs `main`. Superseded in the best way — `eaprime1/tabularium` is now a real, cloned repo (see External Repos above). |
| `feature/session-202607-blackjack21` | Session chronicle, Nexus-as-shadow lore refinement, and **the Radix Scavenger Hunt mission** (four-stage mission for `dannyward630`/`Ojas2095`, reward gated behind Radix reading) | PR #192 (merged 2026-07-09) | — | No registry row exists for PR #192 yet — not stamped at merge time. 0 unique commits vs `main` — live in `atelier/`. Flagging for eaprime1: the Scavenger Hunt mission text is written and merged, but nothing in this pass confirmed whether it was ever actually offered to the two contributors — worth a status check. |
| `navigo5/granum-anchor-review` | Anchor-review seed bundle, `.chatgpt/` nav5 workspace | PR #179 (merged 2026-07-02) | 202607022251 | 0 unique commits vs `main`. |
| `seneschal_seeds` | Ethics foundation + submission pipeline | PR #172 (branch tip commit is the merge commit itself) | — | No registry row found for PR #172 — predates or fell outside this pass's registry review. 0 unique commits vs `main`. |
| `navigo14/concept-grain` | `🌾 The -Grain- Concept.pdf` | Not merged to `main` — content migrated to `eaprime1/tabularium` instead (see Navigo Branches above) | 202607150601 | Listed here too since its work is done, even though the destination wasn't `main`. |

No branches have been deleted. This section supersedes the old "Departed Branches" framing, which implied removal — these branches haven't departed, they've closed.
