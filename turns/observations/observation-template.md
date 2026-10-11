# Observation — PR #<N>

Template prima-clock: 202610070835

Prima-clock: <YYYYMMDDHHMM>
status: open
pr: #<N>
head: <short sha at the time of observation>
observer: <navigo> with <shepherd>

`status:` is `open` while the review is going and `complete` when every item
below is done or carried forward with a reason.

## Seen

- Checks on the head commit: <passed / failed / running, and which>
- Review threads: <open count; each answered, resolved or deferred>
- Merge state: <clean / conflicted / behind>
- Bots: <what each flagged, in one plain sentence each>

## Shepherd Copy

<!-- The reading copy for the Shepherd. Written from the Us perspective: "we" where the
     work was shared, "I" for the navigo's own calls, "you" for the Shepherd. Name who made
     each piece. No invented history. See world/shepherd-copy.md. -->

**Arrived.** <a short reading in plain prose: what came in and why it matters>

**Reading path.**
1. `<path>` — <what it is, why read it, how long>
2. `<path>` — <...>

**Margin** *(the Shepherd's; the navigo leaves it open)*

- <ideas, connections, additions>

**Echoes** *(form: `kind · title · stamp · locator`; no pointer, no entry)*

- <kind · title or filename · stamp · locator> — <one line on what it holds>

## Fixed during the review

- <item, commit>

## Carried forward

- <item, reason, owner, destination>

## Scans

- `bash tools/scan_lexeme.sh`: <result>
- Privacy scan: <no private details or real-place names>
- Prima-clock stamps on new `.md` files: <yes / no>

## Ready for the seal

- [ ] Every item above is done or carried forward with a reason
- [ ] No outstanding requested changes
- [ ] Description filled in: Intent, What Arrived, Resonance, Ethics Check, Sense Check, What Door

## Result

<one honest line: observed and ready for the seal, or what still stands in the way>
