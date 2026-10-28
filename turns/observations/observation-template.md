# Observation — PR #<N>

Template prima-clock: 202610070835

Prima-clock: <YYYYMMDDHHMM>   <!-- finished, UTC -->
Started: <YYYYMMDDHHMM, or "not recorded">   <!-- if it is a guess, write "about ..." and say how you reached it -->
status: open
pr: #<N>
head: <short sha at the time of observation>
observer: <navigo> with <shepherd>

Times: give both a start and a finish whenever both are known. Where a time was not
recorded, a best guess close to the real one is better than none, written as `about ...`
with the reason ("the first comment's time"). Never write an exact-looking stamp that was
made up. A time typed by a person is read as the local time they wrote it in unless they
say otherwise; when it is converted to UTC, say so. Stamps are UTC (`date -u '+%Y%m%d%H%M'`).

`status:` is `open` while the review is going and `complete` when every item
below is done or carried forward with a reason.

## Seen

- Checks on the head commit: <passed / failed / running, and which>
- Review threads: <open count; each answered, resolved or deferred>
- Merge state: <clean / conflicted / behind>
- Bots: <what each flagged, in one plain sentence each>

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
