# Tabularium Integration Backlog

`prima-clock: 202609251844`

The custos-side backlog for the Tabularium bridge (`missions/CUSTOS_BRIEF.md`, `eaprime1/tabularium`). These started as GitHub issues #194–#198 and #204. They were consolidated here on 202609251844 because each one needs the Pixel 8 library (`~/pixel8/library/`), the `agy` CLI, or the tabularium repo itself. None can be finished from custos alone.

To pick one up, open a fresh `mission` issue from the template with a Bot Brief (`docs/issue-system.md` §5), or do it directly in tabularium and link back here.

Status: `OPEN` → `IN PROGRESS` → `DONE` (link) · `BLOCKED` names what it waits on.

---

### 1. `.md` VETTING triage: heading-based classification pass
**Was:** #196 · **Priority:** High · **Status:** OPEN
The `.md` library has 2,228 of 2,603 files in VETTING. Many have clear H1/H2 headings. Run a heading-based classification pass and propose group assignments by pure pattern matching, with no `agy` or Gemini call.
**Model on:** `tabularium/pipeline/crispr_analyze_txt.py` (prefix clusters) and `crispr_titlemancer.py`. **Precedent:** the `.txt` library (210 files, 45 VETTING) already certified.
**Needs:** the library on-device, or a tabularium PR.

### 2. Security scan escalation: immediate alert on a positive credential hit
**Was:** #195 · **Priority:** High · **Status:** OPEN
The consolidators (`crispr_consolidate_*.py`) already scan file headers for SSH keys, API keys and passwords in Phase 3. Watch that output, escalate immediately on any hit instead of waiting for certification time, and log the escalation as a custos issue.
**Reference:** `tabularium/pipeline/CRISPR_PROCEDURE.md`, Phase 3 certification gates.
**Needs:** a run context (Termux cron or a tabularium Action).

### 3. Scheduled library pass: auto-run the Crispr-NiE consolidators
**Was:** #194 · **Priority:** Medium · **Status:** BLOCKED (device)
Run `crispr_consolidate_*.py` on a schedule or file-change trigger against `~/pixel8/library/`, so each library's master index stays current without a manual run.
**Needs:** Termux `cronie` or `termux-job-scheduler` on the Pixel 8.

### 4. AI title pipeline orchestration
**Was:** #197 · **Priority:** Medium · **Status:** BLOCKED (`agy` install)
Once `agy` (Antigravity CLI) works on-device, run the batch loop: `crispr_ai_title.py .md --apply` in batches, re-run `crispr_titlemancer.py .md --apply` after each batch, and report the VETTING reduction.
**Reference:** `tabularium/guides/GUIDE_crispr_ai_title.md`.

### 5. Cross-library health dashboard
**Was:** #198 · **Priority:** Low · **Status:** OPEN
Read every `library_master_*.json` and report per library: total files, VETTING count, last certified date and security-scan status.
**Reference:** `tabularium/pipeline/CRISPR_PROCEDURE.md` (the `library_master.json` schema), `missions/INDEX.md`.

### 6. Commit-length instinct: raise the confidence floor
**Was:** #204 (raised in review on `eaprime1/tabularium` PR #2) · **Status:** OPEN (lives in tabularium)
A single commit (`libraryseed`) isn't a valid basis for inferring a commit-length instinct, and "11 characters" will mislead commit messages for pipeline work. Drop the instinct, or require at least 10 commits before inferring one. The fix belongs in the tabularium repo's instinct file.
