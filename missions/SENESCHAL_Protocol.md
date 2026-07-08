---
name: Seneschal Protocol
type: mission
---

# The Seneschal — Shadow Commissioner

> The Commission is a ceremony. The Seneschal is the daily work.

Where a Commission is a formal, once-deep assignment of meaning — a Sparstone claim, a foundational act — the **Seneschal** operates in the margins: the recurring triage, the quick routing, the small decisions that keep the library alive between ceremonies.

The Seneschal does not need ritual. The Seneschal needs a clear eye and a light hand.

---

## Seneschal Duties

| Task | Frequency | Signal |
|------|-----------|--------|
| Rename files with AI-opener names | As found | filename starts with response opener |
| Route VETTING files to groups | Per library pass | VETTING count > 50 |
| Create QUICKNOTE captures | Per session | new quick.txt, chatgptnote.txt appear |
| Flag truncated files | Per .sh/.py pass | INVALID status in consolidator |
| Update missions/INDEX.md | After each wing | pipeline advances |
| Escalate to Commission | When foundational | new group needed, new philosophy |

---

## What Qualifies for Commission vs Seneschal

**Commission** — a named, permanent act:
- Claiming a Sparstone
- Naming a new group that will persist across the library
- Defining a new library wing (new file type)
- Philosophical decisions about what belongs and what doesn't

**Seneschal** — the recurring steward act:
- Renaming 5 NOISE files (done: 2026-07-07)
- Adding QUICKNOTE group to .txt
- Routing TERMINAL transcripts to SESSION
- Updating analyze scripts to stay in sync with consolidators

---

## Quicknote Protocol

Files named `quick.txt`, `quicknote.txt`, `quicktext.txt`, `chatgptnote.txt` and similar are **fleeting captures** — the margin note, the paste you meant to organize later. They are not noise: they are seeds.

Seneschal handling:
1. Read first line to understand the capture
2. If it belongs to a project → rename with project prefix
3. If it's a prompt or AI instruction → rename and route to appropriate group
4. If truly empty or duplicate → archive to removed_txt.json

---

## Active Seneschal Log

- **2026-07-07** — Renamed 5 NOISE .txt files (Absolutely, / Ah I see / Certainly / Here's a / Thank you for) → DUNGEON, SACRED, CODEX groups
- **2026-07-07** — Created missions/ folder and INDEX.md
- **2026-07-07** — Added QUICKNOTE group to .txt consolidator
- **2026-07-07** — Synced crispr_analyze_txt.py with consolidator groups
- **2026-07-07** — MAJOR PASS: .txt VETTING 194 → 45 (77% reduction)
  - Built crispr_titlemancer.py — title extraction + group-prefix renaming
  - Built crispr_ai_title.py — AI title cache layer (antigravity pending)
  - Built crispr_salvage_txt.py — 12 files migrated to .json/.sh/.py libraries
  - Added 29 new groups: MISSIONS, TERMUX, REFERENCE, UTILITY, DATA, SARGASSO, KA, PANDORA, LIMINAL, QUICKNOTE + universal group-prefix detection
  - Added DESC_OVERRIDES for PRIME, SACRED, MOAV, DIRLIST, SESSION, CODE, DATA, TERMUX, SARGASSO
  - Added security scan to consolidator — caught + removed SSH key fragment (mandelbrot-deploy-clavis)
  - Remaining 45 VETTING = all properly prefixed, awaiting AI title pass or Commission
- **2026-07-07** — .txt CERTIFIED (Titlemancer: 0 renames proposed = stable signal)
  - Save point narrative written: missions/FIRST_LIBRARY.md
  - Memory updated: project_crispr.md reflects all three certified libraries
  - Next: .md library triage (2,228 VETTING / 2,603 total)
