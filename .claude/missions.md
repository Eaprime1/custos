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
**Status:** OPEN (was issue #327, closed 202609251844 to clear the board; tracked here)  
**What:** Token-mindful daily build trigger for each navigo. Each AI that
can verify plan availability should contribute something each day —
push development, create issues, file seeds. If tokens can't be verified,
fall back to issue creation and documentation only.  
**Where:** Pattern lives in `.claude/` (nav1 perspective); will generalize
to `.gemini/`, `.chatgpt/` once validated.

### Gmail as Trigger and Mission Delivery Layer
**Status:** OPEN (was issue #328, closed 202609251844 to clear the board; tracked here)  
**What:** Gmail triggers (native, Zapier, IFTTT) as a delivery mechanism
for navigo missions and daily build actions. Sets the pattern for multi-AI
trigger architecture across the constellation.  
**Where:** `guides/navigo2-gmail-preturn.md` is the preturn foundation.
Playwright stream conversation handles Turn 2.

### Zero-Risk Gmail Actions (navigo2)
**Status:** OPEN, needs the Shepherd at the inbox (was issue #323, closed 202609251844)  
**What:** (1) Create one Gmail filter that routes CC agent daily briefs to `cc-automated` (Label_162). The label exists and has no filter. (2) Bulk-*archive*, never delete, the Unroll.me migration debris (1,770 senders).  
**Why it's here and not done:** the Gmail connector can label and archive threads, but it can't create filters. A 1,770-sender archive is outward-facing and needs the Shepherd's go-ahead in the session that runs it.  
**Done when:** `grep "cc-automated\|Unroll.me" turns/log.md` shows the operation logged.  
**Source:** `pandora/germs/navigo2_germ.md`
