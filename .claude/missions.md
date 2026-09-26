# Missions — .claude

Work assigned specifically to a Claude session's perspective — as
opposed to `.artesian/`, which is open to whichever navigo picks it up
first. Perspective and tracking live here; a Claude session can still
work on other repos when a mission calls for it (this session's own
navigo15 work has spanned custos, pixelator, and prima) — this file just
says where its own open threads are, from custos's side.

## Conventions

- One entry per mission: what it is, status, where the work actually
  lands (may be a different repo).
- Status: `OPEN` → `IN PROGRESS` → `DONE` (link the result) — same
  discipline as `queue/seed-weir/`.
- If a mission stops being Claude-specific and should be open to anyone,
  move it to `.artesian/` instead of leaving it here unclaimed.

## Active Missions

### Daily Navigo Contribution Protocol
**Status:** OPEN → see GitHub issue #327  
**What:** Token-mindful daily build trigger for each navigo. Each AI that
can verify plan availability should contribute something each day —
push development, create issues, file seeds. If tokens can't be verified,
fall back to issue creation and documentation only.  
**Where:** Pattern lives in `.claude/` (nav1 perspective); will generalize
to `.gemini/`, `.chatgpt/` once validated.

### Gmail as Trigger and Mission Delivery Layer
**Status:** OPEN → see GitHub issue #328  
**What:** Gmail triggers (native, Zapier, IFTTT) as a delivery mechanism
for navigo missions and daily build actions. Sets the pattern for multi-AI
trigger architecture across the constellation.  
**Where:** `guides/navigo2-gmail-preturn.md` is the preturn foundation.
Playwright stream conversation handles Turn 2.

### nav3 GitHub Access Gap
**Status:** OPEN  
**What:** nav3 (Gemini + eaprime1) cannot directly observe PR state, CI
check runs, or file to the repo from a Gemini session. The Shepherd
searched for the repo-access option in the Gemini session settings and
could not locate it. Gemini currently contributes via PDF export → `.gemini/`
→ nav1 files on the workaround path.  
**Blocker:** Gemini's workflow presence is also paused pending the
antigravity/navigo21 transition — resolving the access gap may wait
until navigo21 identity is settled.  
**Where:** `.gemini/202609210359_nav3-act2-preturn.md` has the routing context.

### antigravity / navigo21 — Define and Seat
**Status:** OPEN  
**What:** The Shepherd named "antigravity" as the intended navigo21 AI model
assignment (likely replacing or complementing Gemini's current position in
the navigo table). No definition, no workspace folder, no CLAUDE.md entry,
no navigo table row exists yet. The name is held in this session's context
and the `.gemini/` preturn file only.  
**Next action:** Shepherd confirms what antigravity is (model, connector,
account), then: add to CLAUDE.md navigo table, create workspace folder,
create navigo profile, update branch-tracker.  
**Where:** This mission file; `.gemini/202609210359_nav3-act2-preturn.md`.
