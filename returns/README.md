# STREAM RETURNS

External agent findings route here.
Label format: `STREAM N RETURN — [prima-clock timestamp]`

---

## Agent Assignments

| Stream | Agent | Domain | Status |
|--------|-------|--------|--------|
| [stream-1-language](./stream-1-language) | Gemini | Language / Fodere / Agnoscere | Open |
| [stream-2-emotion](./stream-2-emotion) | Gemini | Emotion Architecture | Open |
| [stream-3-variables](./stream-3-variables) | ChatGPT | Variable Constant Violation | Open |
| [stream-4-shepherd](./stream-4-shepherd) | ChatGPT | Shepherd Protocol | Open |
| [stream-5-math](./stream-5-math) | Copilot | Mathematical Backbone / prima-clock | Open |
| [stream-6-grok](./stream-6-grok) | Grok | Domain — TBD (assignment pending) | Pending |
| [stream-7-perplexity](./stream-7-perplexity) | Perplexity | Domain — TBD (assignment pending) | Pending |

---

## How to Submit a Return

1. Place findings in the appropriate stream directory.
2. File naming: `[prima-clock]_[stream-slug]_return.md`
3. Open a PR with label `stream-return`.
4. PR title: `STREAM N RETURN — [prima-clock]`
5. The Shepherd reviews and merges.

---

## Commission Template

When commissioning an agent, include:
- The stream number and domain
- Files to read first: `prima.yaml`, `CLAUDE.md`, and the relevant world files
- The specific question or task for the stream
- Return format: a markdown file dropped into the stream directory

The Shepherd (or Deck Master) reviews all returns before they land in the hub.
