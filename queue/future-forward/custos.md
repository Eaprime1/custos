# Future Forward — custos

`prima-clock: 202610060830`

Decisions for the Shepherd that peer review Run 0 raised on custos's own side or for the whole constellation (`atelier/peer-review/202610_custos-pixelator_run-0.md`). The finding ids are in brackets. Status is `OPEN` until judged, then `RESOLVED` with a link. Rows are not deleted.

| Item | Status | Notes |
|---|---|---|
| `termux_proc.sh` for session closing [CP-6] | OPEN | Pixelator's phone procedure tracker prints a short verification certificate after each step. It might back the closing checklist in `turns/CLOSING.md` when working from Termux. Only its outline has been read. Suggestion: read it in full, then report. **Shepherd 202610060158: yes — use pixelator's tracker script as part of closing sessions.** Next: read it in full, then wire it into `turns/CLOSING.md`. |
| Map custos's intake folders to the routing ladder [CP-7] | OPEN | `pixelate/ROUTING.md` in pixelator sets out where content goes. Custos's `incoming/`, `queue/` and `intake/` do not yet say how they line up with it. Suggestion: a draft mapping for the Shepherd to correct. **Shepherd 202610060158: start with pixelator's routing ladder as a contribution, then adapt it to custos.** Next: a draft in `queue/` or `atelier/`. |
| Per-round final-review records [CP-8] | OPEN | Pixelator keeps `pr-journeys/final-reviews/`, one record per round of final-review findings. Custos's journeys record the outcome only. Suggestion: read pixelator's one example, then try it on a single PR. |
| One timezone for prima-clock stamps [H-2] | OPEN | The seal on custos #406 read `202610060704` (UTC) and the cue record for the same minute read `202610060004` (Pacific). Suggestion: Pacific, since the Shepherd's own stamps are Pacific, with the stamp produced by one small shared script. **Shepherd 202610060158: the Shepherd uses local time (Pacific, or wherever they are); official things, and the seal, are UTC so they do not depend on location.** Decision recorded. Still to settle: whether custos's cue record counts as official (it stamps Pacific today; pixelator's now stamps UTC). |
| Name of the old word-marker list [H-6] | OPEN | `tools/scan_lexeme.sh` calls its marker words (TODO, FIXME and others) "distressed lexemes", the same name as the weighted words in `atelier/lexemes/distressed-lexeme-list.md`. Suggestion: call the first "unfinished markers". |
