# Podiums

<!-- append only — never edit past entries except status/notes -->
<!-- schema: device/PODIUM_SCHEMA.md -->

The registry of known podiums — places custos work happens from. Each entry
is an anchor: a `podium_id` that turns, carriers, and install-log entries can
reference to say *where* and *under which profile* a piece of work happened.

This is a living form. Give a location and we add an entry.

## Log

---
podium_id:       pixel8
name:            "Pixel 8 (Termux)"
type:            device
platform:        termux
profile:         ""
parent:          ""
conversation_id: ""
role:            "Primary device Podium for custos — see device/pixel8.yaml"
status:          active
notes:           Android 14 (API 34). Repo at ~/pixel8/custos. Branch
                 `pixel8` is its book of record; live device state tracked
                 in device/pixel8.yaml.
---

---
podium_id:       mulberry
name:            "Mulberry (Windows laptop)"
type:            device
platform:        windows
profile:         ""
parent:          ""
conversation_id: ""
role:            "Shepherd's Windows laptop — source of the artesian queue (queue/artesian/)"
status:          active
notes:           Path convention seen so far: `C:\Users\eapri\mulberry\queue\artesian\`.
                 Candidate Cygwin podium — see seep-artois/cygwin-installation.md
                 for the setup carrier if this becomes a bash-capable podium.
---

---
podium_id:       custos-web-jolly-bohr
name:            "Claude Code on the web — custos"
type:            conversation
platform:        claude-code-web
profile:         "Claude platform (eaprime@gmail.com)"
parent:          ""
conversation_id: "session_019HdoPhLhafD5Tr5G3ywNax"
role:            "This session's work surface for custos — branch claude/jolly-bohr-dgjrs1"
status:          active
notes:           Runs in an ephemeral remote container — no persistent
                 filesystem between sessions. GitHub access scoped to
                 eaprime1/custos via MCP. Distinct from pixel8/mulberry:
                 device-less, but still a podium of record for the work it does.
---

---
podium_id:       custos-web-pre-nullus
name:            "Claude Code on the web — custos"
type:            conversation
platform:        claude-code-web
profile:         "Claude platform (eaprime@gmail.com)"
parent:          ""
conversation_id: "session_01N9rgN8W3W93TEFMQ3CkP4t"
role:            "PR #43 review/finalize cycle — branch claude/pre-nullus-review-bv7ova"
status:          dormant
notes:           Subscribed to PR #43 webhook activity end to end: resolved
                 three Gemini Code Assist suggestions, answered the owner's
                 status question, watched the owner merge once approved, and
                 surfaced a real bug in finalize-pr.yml (issue_comment trigger
                 never fires — filed as issue #44). Ephemeral remote container,
                 same constraints as custos-web-jolly-bohr.
---
