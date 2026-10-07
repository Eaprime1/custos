# Reserved Lexemes

prima-clock: 202610070820
status: draft (the Shepherd decides what stays)

Some words carry two loads: they are command language in the tools and
workflows, and they carry emotional weight in narrative ("you are being
replaced"). The placeholder scanners (`tools/scan_lexeme.sh`, the review
packet) do **not** flag these words, because flagging them in prose would
treat a real sentence as an unfinished one.

This list is mainly for commands. In narrative it is not critical: use the
word with care, and let the scene carry it.

## Criteria for adding a word

- It is an operation word in a tool, workflow, or protocol.
- Or it carries weight in narrative that a scan would flatten.
- It is not a shouted marker (`TODO`, `FIXME`, `BROKEN`, `TBD`, `UNKNOWN`);
  those stay scanned, in capitals.

## Entries

| Word | Command use | Narrative weight | Note |
|------|-------------|------------------|------|
| replace | substitute text or a file in place | being replaced; a seat given to another | Used with care. Scanner dropped it from the placeholder list. |

Lowercase "unknown" in prose is also not scanned; only the capitalised
`UNKNOWN` marker is.

## Glossary: the shouted markers

The scanners flag these five words only when written in capitals as a whole word.
They are working-note shorthand, not acronyms.

| Marker | Short for | Meaning here |
|--------|-----------|--------------|
| `TODO` | "to do" | Work left to do. |
| `FIXME` | "fix me" | A known fault that needs fixing. |
| `BROKEN` | "broken" | Something known not to work. |
| `TBD` | "to be determined" | A decision or value not settled yet. |
| `UNKNOWN` | "unknown" | A fact nobody has found yet. |
