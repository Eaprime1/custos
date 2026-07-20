---
name: Custos Brief — Library Integration
type: mission
date: 2026-07-08
for: eaprime1/custos
---

# Custos Brief: Tabularium Library Integration

> The library is built. The guardian needs to know it exists.

This document captures what the Crispr-NiE library pipeline needs from Custos,
and what Custos can leverage from the library system.

---

## What the Library System Is

**Tabularium** (`eaprime1/tabularium`) is a personal knowledge library pipeline:
- Manages ~3,000+ files across `.json`, `.py`, `.txt`, `.md`, `.sh` libraries
- Each library has a master index JSON, group classification, noise archive
- Pipeline: snapshot → repair → rename → consolidate → certify
- All scripts in `tabularium/pipeline/`
- Missions/workflows documented in `tabularium/missions/`

**Current state:**
- `.json`, `.py`, `.txt` → Certified
- `.md` → 2,603 files, 2,228 in VETTING (primary triage work pending)
- `.sh` → Consolidate done, 2 truncated files pending repair

---

## What Custos Could Do for the Library

### 1. Automated Library Passes (Scheduled)

Run `crispr_consolidate_*.py` on a schedule or on file-change trigger.
Update the master index without manual invocation.

```python
# Custos task: library_pass
# trigger: cron or file-watch on ~/pixel8/library/
# action: python3 ~/crispr_consolidate_txt.py
#         python3 ~/crispr_consolidate_md.py
# notify: if VETTING > 50 or SECURITY > 0
```

### 2. Security Alert Escalation

The consolidators already scan for SSH keys, API keys, passwords in file headers.
Custos could:
- Monitor the security scan output
- Escalate immediately on any positive hit (no waiting for next manual run)
- Log to custos issue tracker

### 3. VETTING Triage Assist

The .md library has 2,228 VETTING files. Many have clear headings.
Custos could run heading-based classification passes and propose group assignments
without needing agy/Gemini (pure pattern matching on H1/H2 content).

### 4. AI Title Pipeline Orchestration

Once `agy` is working, Custos could orchestrate batch title extraction:
- Call `crispr_ai_title.py .md --apply` in batches
- Monitor progress
- Re-run `crispr_titlemancer.py .md --apply` after each batch
- Report VETTING reduction

### 5. Cross-Library Health Dashboard

Read all `library_master_*.json` files and produce a unified status report:
- Total files per library
- VETTING counts
- Last certified date
- Security scan status

---

## What the Library Offers Custos

### 1. Structured Knowledge Index

Every certified library has a `library_master_*.json` with:
- `file`, `group`, `description/heading`, `size` per file
- Group summaries
- Notes embedded

Custos can query these as a structured knowledge base.

### 2. Domain Vocabulary (from GUIDE_crispr_ai_title.md)

The library's domain terms (PRIME, CODEX, SACRED, EMBER, MOAV, KA, PIXEL8, SARGASSO)
are documented in `tabularium/guides/GUIDE_crispr_ai_title.md`.
Custos should internalize these to avoid mis-classifying domain-specific content.

### 3. Missions as Task Queue

`tabularium/missions/INDEX.md` — current library status and active missions.
`tabularium/missions/WORKFLOWS.md` — the standard operating procedures.
Custos can read these as its task queue for library-related work.

---

## Proposed Custos Issues to Create

| # | Title | Priority |
|---|-------|----------|
| 1 | Scheduled library pass — auto-run consolidators | Medium |
| 2 | Security scan escalation — immediate alert on positive hit | High |
| 3 | .md VETTING triage — heading-based classification pass | High |
| 4 | Cross-library health dashboard | Low |
| 5 | AI title pipeline orchestration (pending agy install) | Medium |

---

## Files to Reference

| File | Location | Purpose |
|------|----------|---------|
| Pipeline scripts | `tabularium/pipeline/` | The tools |
| Missions | `tabularium/missions/` | Task queue + SOPs |
| Master indexes | `~/pixel8/library/.*/*.json` | Knowledge base (local only) |
| Domain vocab | `tabularium/guides/GUIDE_crispr_ai_title.md` | Classification context |

---

*Created 2026-07-08 — bring to eaprime1/custos for issue creation*
