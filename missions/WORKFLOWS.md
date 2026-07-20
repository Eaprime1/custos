---
name: Library Workflows
type: mission
date: 2026-07-08
---

# Library Workflows

> A workflow is a mission that repeats. The Seneschal runs it; the Commission names it.

These are the recurring operational patterns for the Tabularium / Crispr-NiE system.
Each workflow is a named sequence of commands with a clear trigger and output.

---

## Core Workflows

### W1 — Library Pass (per file type)

Run after new files are added to any library folder.

```bash
python3 ~/crispr_consolidate_txt.py          # .txt
python3 ~/crispr_consolidate_md.py           # .md
python3 ~/crispr_run.py .json --stage 3      # .json
python3 ~/crispr_run.py .py --stage 3        # .py
```

**Output:** Updated master JSON + library report  
**Trigger:** New files added, or weekly maintenance

---

### W2 — VETTING Triage Pass

After a library pass shows VETTING count > 20.

```bash
python3 ~/crispr_analyze_txt.py              # see prefix clusters
python3 ~/crispr_titlemancer.py .txt         # propose renames
python3 ~/crispr_titlemancer.py .txt --apply # execute (review first)
python3 ~/crispr_consolidate_txt.py          # re-run to update master
```

**Output:** VETTING count reduced, files properly grouped  
**Trigger:** VETTING > 20 files in any library

---

### W3 — AI Title Pass

For files in VETTING with uninformative filenames (after W2 leaves low-confidence cases).

```bash
python3 ~/crispr_ai_title.py .txt --limit 10   # test run
python3 ~/crispr_ai_title.py .txt --apply       # full batch (requires agy)
python3 ~/crispr_titlemancer.py .txt --mode clean --apply  # apply AI titles
```

**Output:** ai_titles.json populated, remaining VETTING files renamed  
**Trigger:** Titlemancer returns 0 HIGH-confidence renames; files still in VETTING

---

### W4 — Security Scan

Baked into the consolidator — runs automatically on every library pass.  
Standalone trigger if suspicious:

```bash
python3 ~/crispr_consolidate_txt.py --report
```

Look for `⚠️ SECURITY` in output. Act immediately on any flagged file.

---

### W5 — Salvage Pass

After a library pass shows CODE group files in .txt (or other misplaced content).

```bash
python3 ~/crispr_salvage_txt.py              # dry run — review plan
python3 ~/crispr_salvage_txt.py --apply      # execute moves
python3 ~/crispr_consolidate_txt.py          # re-index after moves
```

**Trigger:** CODE group in .txt > 3 files, or suspicious .json/.py content in .txt

---

### W6 — Certification Check

Run when a library stabilizes (Titlemancer proposes 0 renames).

```bash
python3 ~/crispr_run.py .txt --stage 4      # snapshot diff + certification
```

**Output:** Certification document in library folder  
**Signal:** VETTING stable + Titlemancer clean + security clean

---

### W7 — New Library Type

When a new file extension needs a library.

1. Create `~/pixel8/library/.{ext}/` folder
2. Create `crispr_consolidate_{ext}.py` — define GROUPS + validity check
3. Register in `crispr_run.py` ADAPTERS dict
4. Run W1 for the new type
5. Log the new library in missions/INDEX.md

**Pending new types:** `.pdf`, `.yml`, `.docx`, `.mp3`, `.mp4`

---

## Workflow Status Board

| Workflow | Last Run | Next Trigger |
|----------|----------|-------------|
| W1 Library Pass (.txt) | 2026-07-07 | New files added |
| W1 Library Pass (.md)  | 2026-07-07 | Ready now |
| W2 VETTING Triage (.md) | pending | After W1 |
| W3 AI Title Pass (.txt) | pending | agy working |
| W5 Salvage (.txt) | 2026-07-07 | Clean |
| W6 Certification (.txt) | 2026-07-07 | Certified |
| W7 New Type (.pdf) | pending | Survey complete |
