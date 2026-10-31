# .gemini/feed — where carried notebook content lands

`prima-clock: 202610310949` (UTC)
`plank germ` · a test run exists, nothing else · origin: the Shepherd, chat `set-jmdfqh`, 2026-10-31

*Grows by addition. New material goes under "Added later" with a stamp.*

For voices that cannot write to GitHub, the Gemini notebooks first. The path is Drop, Courier, Arrival.

| Step | Who | Where |
|---|---|---|
| Drop | The Shepherd exports a notebook and saves it | Drive, `🚥shadow_stream` / `feeder` |
| Courier | A navigo with the Drive connector reads the folder and files it by pull request | |
| Arrival | The file, kept as received | here, `.gemini/feed/` |

## Rules (proposal)

- File name: `<prima-clock>_<cid>_<slug>.<ext>`. The cid ties the file to its conversation (`tools/session_id.sh`).
- Notebook exports are saved as **`.md`** (the Shepherd's word, 202610311100 UTC or just after). Plain text keeps its bytes, so the hash can start at the drop.
- A carried file is **never edited**. The sign-in card, the SHA-256 and any notes go in a sidecar `<same name>.receipt.md`.
- The receipt says what kind of drop it was (a Shepherd export, or a test) and which courier did it.
- A file stays here until the Shepherd routes it. When it moves, this folder keeps a pointer to the new anchor.
- If the content came out of a notebook that was called **NotebookLLM** (before "voices of navigo"), say so in the receipt. A Jira Epic in NEXUS is created for such content as it is found.
- Nothing here seals, merges, or approves anything.

## Runs so far

| Stamp (UTC) | Kind | File | Result |
|---|---|---|---|
| 202610310949 | Test, by Navigo Claude | `202610310950_set-jmdfqh_signum-certification-seed.md` | Same SHA-256 in Drive and here. See its receipt. |

## Added later

(nothing yet)
