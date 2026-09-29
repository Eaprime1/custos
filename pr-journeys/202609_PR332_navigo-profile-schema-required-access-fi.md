# PR Journey: #332 — Navigo profile schema + required_access field in issue templates

**Repository:** Eaprime1/custos  
**prima-clock:** 202609210952  
**Branch:** `claude/email-routines-inbox-mining-7y0xdu` → `main`  
**Author:** @Eaprime1  
**State:** MERGED (momentum stub — not finalized)  

## Intent

Establish the navigo access badge system: a way for navigo workspace profiles to declare which external resources (NotebookLM notebooks, Google Drive folders) a navigo has earned access to, and for issues to declare which badges are required to execute them at sparstone level.

## What Arrived

### `.claude/navigo-profile.md` — nav1 profile instance

- Declares the **badge schema** for navigo workspace folders (applicable to `.claude/`, `.gemini/`, `.chatgpt/`)
- Defines six badge tokens: `notebook:radix`, `notebook:custos-spectrum`, `drive:custos-root`, `drive:breathe-ii`, `drive:breathe-ii-act-i`, `drive:breathe-ii-act-ii`
- Badges are Shepherd-granted (prima-clock stamp on the `Granted` column)
- Explains the voice credential concept: a navigo with notebook access speaks from source authority
- Includes nav1's active queue as a working section

### Issue templates — `required_access` field

Added to `mission.yml`, `bounty.yml`, and `upgrade.yml`:

- Optional input field, placed between `context` and `xp`
- Contributor lists badge tokens needed (e.g. `notebook:radix, drive:breathe-ii`)
- Blank = no access gating; the field only appears when a mission requires notebook/Drive context to execute correctly

## Resonance

*grounded*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609210937 | @Eaprime1 |
| Merged | 202609210952 | @Eaprime1 |

## Files Changed

8 file(s) · +237/−1

---
**prima-clock:** 202609210952  
**witnessed:** true  
*momentum stub — archivist · 🌿 Custos — the shepherd closes the fold · ∰🌿*