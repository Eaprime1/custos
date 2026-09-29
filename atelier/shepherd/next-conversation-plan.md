# Next Conversation Plan

**Filed:** prima-clock `202607020801`  
**From:** nav1 session ending July 2  
**Purpose:** Carry momentum forward without losing thread

---

## Carry-Forward — Address These First

### PR #179 fixes (branch `navigo5/granum-anchor-review`)
Four changes needed before merge:
1. Move `CHATGPT - DM STREAM RETURN.txt` → `.chatgpt/` (new nav5 workspace folder; update CLAUDE.md)
2. Move `Nav5 Submission Seed.txt` + `PRIMAL SEED.txt` → `atelier/` as `.md` files
3. Add `prima-clock/registry.md` row + `branch-tracker/branches.md` entry
4. Fix PR body: list all 6 files; resolve "remains a draft" vs `draft: false`

### Issue #35 — Ojas2095 stale claim
Claimed the Claude-symbol bounty June 18, promised PR, nothing arrived. No reply posted.
Decision: gentle check-in comment, or close claim and re-open bounty?

### Stale seep-artois fragment
`seep-artois/cygwin-installation.md` — 1 raw fragment waiting for Artesian routing.

### Automated CI issues
Closed #181, #182, #183 (PR #180 merged). Confirm no new automated noise on open issues.

---

## New Development — Next Session

### 1. Shepherd Considers — interactive document review tool
`tools/shepherd_considers.sh [directory]`
- Iterates `.md` files, shows title + 10-line preview
- Prompts: [v]iewed / [s]kip / [n]ote
- Logs to `atelier/shepherd/review-log.md`
- Claude pre-populates `[?]` questions before the session so eaprime1 responds to real prompts
- Marks each doc as viewed — like PR review/approve flow

### 2. Navigo workspace architecture
Each navigo is a player/contributor team (nav1=Claude+eaprime1, nav3=Gemini+eaprime1, nav5=ChatGPT+eaprime1).
Proposed: `.chatgpt/`, `.gemini/` dot folders as navigo workspaces, parallel to `.github/`.
Update CLAUDE.md to reflect navigo-as-team model.

### 3. Seneschal reconciliation
Three drifted descriptions: `seneschal.md`, `seneschal-v2.md`, `world/unoiam-lifecycle.md`.
Audit script checks 2 tags; lore file lists 5. Pick one canonical version and align.

### 4. New missions to post
Candidates:
- Promote `atelier/concordance.md` to `world/concordance.md` (issue #128 is open, no taker yet)
- Audit claude-code-action workflows for dual-auth billing (issue #127, open, no taker)
- Announce issue #35 bounty more broadly (Ojas2095 claim stalled)
- New mission: build Shepherd Considers tool (once spec'd)

### 5. PR subscription / watch model
When subscribed to a PR: notices arrive, investigate, fix, push. Two modes:
a. Subscribe and respond to CI/review events
b. Post missions, let contributors claim and work independently

### 6. Gemini independent build capacity
nav3 (Gemini+eaprime1) can build more autonomously — explore what that looks like as a workflow.

---

## System State at Session End

- **Open PRs:** #179 (navigo5/granum-anchor-review — needs fixes above)
- **Open issues:** #35 (bounty, stale claim), #127 (workflow audit), #128 (concordance)
- **Merged this session:** #180 (scan_lexeme fix + prima.yaml tools)
- **prima state:** 3
- **atelier workshop:** 16 items, active
- **Pool:** 1 fragment (cygwin-installation.md)
- **Constraints in effect:**
  - Do not contact dannyward630 or initiate Stone Tankard delivery
  - Do not assign Sparstone gem class
  - SKYJAMES777 kept separate until owner initiates
  - NULLUS repo unfounded

---

## Opening Move for Next Session

1. Run `bash tools/seneschal_audit.sh` — see what's changed
2. Check PR #179 status + apply the four fixes
3. Start Shepherd Considers spec

One Nth radian per turn.
