# Hodie handoff — daily element report

Status: design and transfer instructions, not a live Hodie integration. Custos `atelier/element-of-the-day/` is the incubation home for the reusable element-report template. `eaprime1/hodie` is the intended later home for a general daily-reports system; that system is not yet defined or deployed. Do not claim this document schedules, publishes or syncs anything.

## Source of truth while incubating

- Existing daily routine: runs outside this repository and produces a report. Its location, export format, delivery time and current element cursor have not been verified in this PR. Keep its actual report and cursor canonical there until Eric confirms an integration.
- Custos: `entry-template.md` is a *shape* for reviewed element reports; `state.md` is explicitly not yet started in this repo. Do not reset the external routine to hydrogen or advance this cursor merely because a calendar day passed.
- Hodie: future receiving/publishing home only after its daily-reports system has an agreed schema, storage path, ownership and schedule. Do not create a second daily scheduler by copying this seed.

## Reusable report shape

Use `entry-template.md` for the science and story. At transfer time add this transport envelope, with values verified from the originating report:

| Field | Meaning |
|---|---|
| `report_date` | Calendar date and timezone of the original run, not inferred from ingestion time. |
| `routine_source` | Stable link or identifier for the originating daily routine. |
| `source_report` | Link or immutable identifier for the original report. |
| `atomic_number` / `symbol` | The element actually covered in the source report. |
| `sequence_status` | Completed, skipped, deferred or not known; do not invent backfill. |
| `news_items` | Optional linked items with publication date, primary source and confidence. |
| `review_state` | Draft, checked, corrected, or held; name reviewer and date. |
| `next_atomic_number` | The source routine's verified next step, if known. |

This envelope is a proposal for Hodie to adapt, not a claim that Hodie already supports these fields. Reference original sources rather than replicating private Drive content into public GitHub.

## One-hertz transfer test

1. Confirm with Eric the existing routine's source, report format, timezone and current cursor. Pick one real, shareable report with permission to cite it.
2. Map that report into the template without changing its scientific claims; distinguish daily report date, article publication date, and discovery date. Verify element facts and provenance.
3. In Hodie, design the shared daily-report intake once, with a report-type field that can later accommodate element reports and other report series. Agree on where the schedule lives; prefer one producer and one receiving path.
4. Create a separate draft PR in `eaprime1/hodie` for the minimal receiver/template when that shared system is ready; link this Custos seed and the original report.
5. Test one report end-to-end. Record fields lost, duplicate deliveries, idempotency key (source report identifier plus run date), and cursor handling. Only then decide whether automatic ingestion is worthwhile.

## Exit criteria from atelier

One verified source report maps without invention; Hodie has an agreed common daily-report surface; Eric approves the destination and publication level; duplicates and skipped days have an explicit rule; and the Custos seed remains a provenance link rather than a competing live cursor.
