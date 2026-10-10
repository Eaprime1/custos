# Email mining pass — 2026-10-07 (prima-clock 202610071616)

Exploratory sample, metadata and snippets only. No messages were opened in full, and none were changed.
Personal and third-party details (medical, rent, reimbursement threads) are deliberately left out of this note.

**Sampled:** the 30 newest inbox threads (Oct 6–7), the Sent folder for 30 days (6 threads), 15 threads from xda / Electronic Goldmine, and the label list. Spam for 30 days came back empty.

## Mailbox shape
- INBOX holds about 94k threads, and about 90k of them are unread (95%). Unread is the default state, so "unread" carries no signal.
- Spam shows 1,516 unread threads, and the Marketing label shows 601 of 619 unread. Both pile up unread.
- User labels are tiny next to that: `Notification` (241 threads), `Unroll.me` and `Unroll.me/Unsubscribed` (about 3,000 threads together), `_eaprime` (42), `__prime paradox paradigm` (24), `Microstreams` (14).
- The `Prime/Archive System/*` tree holds a past organizing scheme: Selling/EBAY, Selling/Paypal, GPT/Savings Catcher (227 threads), Save Folder.

## Ideas

1. **Cadence is a fingerprint.** Electronic Goldmine arrives daily at about 11:00 UTC and runs 580–710 KB. xda-developers sends 1–3 a day, from 11:00 to 13:00 UTC and again late evening. Sender, hour and size make a stable signature before any text is read.
   - Why interesting: a size or timing change would flag a template change, a sale cycle, or a sender going quiet.
   - Connects to: `pinecone-noise-typology.md` and `gmail-vetting-layer.md` in this folder. Neither was read this run.
2. **Duplicatus carrier for bulk senders.** Slickdeals sent 5 near-identical "deal" mails in about 24 hours. Amazon `store-news` sent 2 "Prime Big Deal Days" mails in the same window. Allrecipes, XDA, Perpay, Slickdeals and Amazon all ran Prime Day content (Oct 6–7).
   - Why interesting: one carrier per sender or campaign could keep a count, first and last seen, the subject variants, and a size band. That is the "identity + times encountered/deleted" record the task asks for.
   - Connects to: the MOAV / carbonite model. One carrier per sender, with copies folded in as counted aspects.
3. **Campaign synchrony.** Unrelated senders locked onto the same event on the same day. A cross-sender topic cluster per day is cheap to compute, and it separates real signal from the event's noise.
4. **Machine-written mail from the user's own systems.** The inbox carries a Codacy result for `custos/main` (commit a75b78b, "Scanner stops flagging replace/unknown…", gate passed). It also carries Notion, PayPal and Google Play receipts, and a Google Alert (name watch).
   - Why interesting: the user's own tools already write to the mailbox. Codacy could be parsed into `turns/review-surface.md`, and receipts could become a spend log.
   - Connects to: the CI mail trail; the Zapier / IFTTT connectors present in this session.
5. **Ghost infrastructure.** A Slickdeals alert is named "Any Thread (Fire Rating)" and a Leafly horoscope is sitting unread. A reply-tracking label set (`To Respond`, `FYI`, `Awaiting Reply`, `Actioned`, `Meeting Update`) is almost empty. The dormant labels are an unfinished triage layer, ready to reuse.
6. **Stray address.** Virtual Vocations mail arrives addressed to a second address (eaprime@live.com) and advertises 40,103 "matching" remote jobs a day, an implausible number. Count-in-subject claims could be tracked for absurdity.

## Two-routine sketch (management feeds mining)
- **Manage:** per-sender ledger (identity, first/last seen, count, deleted count, size band, hour histogram), todo extraction, junk routing. Output is a plain table in the repo.
- **Mine:** reads the ledger plus samples, writes notes like this one.
- A shared ledger file is the link between them, so it works as two routines or as one system with modules.

## Next time
- Read the ledger idea against `gmail-vetting-layer.md` first.
- Get label IDs working in queries (label-name search returned nothing).
- Sample the `Savings Catcher`, `Microstreams` and `__prime paradox paradigm` labels by ID.
