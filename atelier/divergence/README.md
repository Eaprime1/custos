# Divergence seeds

`prima-clock: 202610310949` (UTC)
`plank germ` · the name "divergence seed" confirmed by the Shepherd · origin: the Shepherd, chat `set-jmdfqh`, 2026-10-31

*Grows by addition. New material goes under "Added later" with a stamp.*

## The idea

At level 21 one conversation became too wide. Instead of ending it or folding more into it, it diverges: new conversations start, each with one job. **They do not collapse back into the conversation they came from.** They keep a connection, and each lives on as its own thing.

The Shepherd asked whether these are new seeds, and whether to call them **divergence seeds**. He confirmed the name: "divergence seed works" (202610311100 UTC or just after).

## What a divergence seed holds

| Part | What it says |
|---|---|
| Own cid | The new conversation's id, minted with `tools/session_id.sh` |
| Parent cid | The conversation it came from. This is the connection |
| First line | What the Shepherd pastes to open it: `Session: <cid> · type: <type>` |
| Job | The one thing this conversation does |
| Receives | What is handed over, with where each thing lives |
| Does not do | What stays with other conversations |
| Connection | How the parent and the child know about each other without merging |
| Not known | What was left open |

## The connection, without collapse

- Both cids appear in `.claude/conversations.md`, the child's row naming its parent.
- A ticket the child works on can carry the label `conv:<cid>` (held for KAN-6).
- Nothing the child decides is binding on the parent, and the other way round. A thing that has to cross goes by a handoff note the Shepherd carries or files, not by merging chats.
- Changing ownership of content is an **anchor** move: the content's domos is where it is pinned, and the old place keeps a pointer.

## The seeds

| File | Own cid | Job |
|---|---|---|
| `baton-pass-seed.md` | `oth-8hjtba` | Take content that is beyond the Jira-first conversation's scope |
| `pr-observer-seed.md` | `con-zq8yj6` | Process pull requests as the oversight observer |

The parent, `set-jmdfqh`, stays the all-things-Jira conversation.

## Added later

(nothing yet)
