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
role:            "PR #43 review/finalize cycle, then PR #45 turn-closing cycle — branch claude/pre-nullus-review-bv7ova"
status:          dormant
notes:           Subscribed to PR #43 webhook activity end to end: resolved
                 three Gemini Code Assist suggestions, answered the owner's
                 status question, watched the owner merge once approved, and
                 surfaced a real bug in finalize-pr.yml (issue_comment trigger
                 never fires — filed as issue #44). Then closed its own turn
                 in PR #45 — fixed a Gemini-flagged trailing newline on
                 prima-clock/registry.md, merged on the owner's go-ahead
                 (`841827b`), unsubscribed clean. Ephemeral remote container,
                 same constraints as custos-web-jolly-bohr.
---

---
podium_id:       mulberry-vscode-navigo
name:            "Claude Code in VSCode — custos (Mulberry)"
type:            conversation
platform:        vscode
profile:         "Claude platform (eaprime@gmail.com)"
parent:          mulberry
conversation_id: ""
role:            "Sixth blackjack-event session — PR #133/#134 review,
                 partner-perspective journey, first state-of-custos
                 document. Shepherd's own naming for this conversation:
                 nav1 (eaprime1) + nav2 (Claude), navigo perspective."
status:          active
notes:           Persistent local filesystem (unlike the ephemeral
                 custos-web-* podiums) — full repo access on the Mulberry
                 device, not a remote container.
podium_id:       custos-web-youthful-goldberg
name:            "Claude Code on the web — custos"
type:            conversation
platform:        claude-code-web
profile:         "Claude platform (eaprime@gmail.com)"
parent:          ""
conversation_id: "session_019jhH4S2WRd8Egk3sNmUkgN"
role:            "Fixed issue #44 (invalid secrets reference in job-level if: conditions) and watched PR #73 through to a close — branch claude/youthful-goldberg-3ank89"
status:          dormant
notes:           Subscribed to PR #73 webhook activity: diagnosed two
                 recurring `claude-review` CI failures as the same benign,
                 self-resolving GitHub Actions workflow-validation quirk
                 (PR modifies claude-code-review.yml itself, so its content
                 legitimately differs from main until merge); removed stray
                 "Underwriters Laboratories" reference flagged by Codacy in
                 atelier/testing-lab.md; watched DeepSource converge to
                 Grade A across two commit ranges. Ephemeral remote
                 container, same constraints as custos-web-jolly-bohr.
---

---
podium_id:       pixel8a-unexusi
name:            "Pixel 8a (Termux + PRoot Debian)"
type:            device
platform:        termux
profile:         "Claude platform (eaprime@gmail.com)"
parent:          ""
conversation_id: ""
role:            "Pinnacle non-repo working device — clones repos fresh into
                 ~/unexusi/ (Termux home, reachable from PRoot at
                 /data/data/com.termux/files/home/unexusi/) rather than
                 working against scattered prior clones. First work: ported
                 custos's .claude config and full .github governance
                 pipeline onto eaprime1/pixelator, then triaged and closed
                 10 stale pixelator branches (5 deleted, 5 resurrected as
                 PRs #6-#10, all merged)."
status:          active
notes:           Debian GNU/Linux 13 (Trixie), aarch64, glibc 2.43 patched
                 in for Antigravity CLI. Distinct from the `pixel8` podium
                 above — different clone path (~/unexusi vs ~/pixel8),
                 fresh PRoot environment. custos cloned at
                 ~/unexusi/custos; pixelator at ~/unexusi/pixelator.
---
