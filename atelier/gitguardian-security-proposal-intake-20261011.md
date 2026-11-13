# GitGuardian Guardrails — Received Proposal and Review Carrier

`suit: ♦️ Diamond — proposal, not yet installed`
`prima-clock: 202610111156`
`source: user-supplied 25-page PDF, "Repository Structure gitguardian .pdf"`
`status: OPEN-technical-review-and-source-archival`

## Intent

Receive a conversation-produced security package into Custos without assuming that the proposing conversation had GitHub write access. Preserve the proposal's distinct ideas, identify reconciliation work, and leave the final configuration to a later review. This document is a **substantive intake synopsis**, not a verbatim PDF archive or a claim that the proposed integrations are installed.

## Source Map

The PDF contains multiple dialogue segments (nine labelled tabs, several blank separators):

- **Tab 1 / pp. 2–6:** unified package manifest, five proposed files, workstation branch and draft PR sequence.
- **Tab 2 / p. 8:** security checklist and ignored paths configuration.
- **Tab 3 / p. 10:** proposed agent security instructions.
- **Tab 4 / pp. 12–13:** developer MCP, AI hooks, and security boundary rationale.
- **Tab 5 / pp. 15–16:** ggshield machine-wide hook discussion.
- **Tab 6 / pp. 18–19:** native vs pre-commit hook installation proposals.
- **Tab 7 / pp. 21–22:** native GitGuardian App compared with Actions-based integration.
- **Tab 8 / p. 24:** product overview and pricing claims.
- **Tab 9 / p. 25:** blank.

The source PDF was attached to the originating conversation, **not uploaded to GitHub or Google Drive by this intake**. Its raw transcript and citations must be preserved separately before treating this carrier as a complete archive. Treat version, capability and pricing claims as historical source claims pending verification.

## Five Proposed Configuration Artifacts

| Proposed path | Intended function | Review required |
| --- | --- | --- |
| `.github/workflows/gitguardian.yml` | Run GitGuardian secret scanning on pushes/PRs | Verify GitGuardian App overlap, event permissions, secret provisioning and current action version |
| `.github/AGENTS.md` | Direct AI collaborators to avoid credential leakage | Check actual agent instruction discovery and tool availability; do not claim hooks are already active |
| `.github/pull_request_template.md` | Add security checklist to PRs | **Existing file is `.github/PULL_REQUEST_TEMPLATE.md`; extend that rather than create a competing template** |
| `.gitguardian.yaml` | Record scan exclusions / exceptions | Avoid blanket ignoring tests, mocks and fixtures without assessing leaks in those paths |
| `.pre-commit-config.yaml` | Local ggshield pre-commit gate | Correct source's incomplete URL (`https://github.com`); verify actual repo/revision and supported stage syntax |

## Specific Source Concerns to Resolve

1. The PDF's Tab 1 pre-commit example uses `repo: https://github.com`, while Tab 6 specifies `https://github.com/gitguardian/ggshield`. The unified example as written is not deployable without correction.
2. The source describes `ggshield` machine hooks and GitGuardian Developer MCP as enabled or universally intercepting actions. These are **claims in the source**, not confirmations about any actual connected workstation or agent.
3. The workflow depends on `GITGUARDIAN_API_KEY`, which must be managed outside repository content if used. No token belongs in this PR or public source archive.
4. The proposed ignores encompass all tests, mocks, and fixtures, which can hide accidental real credential exposure. Any exception needs narrow justification.
5. The source proposes a lower-case PR template path. Custos currently has a living `.github/PULL_REQUEST_TEMPLATE.md`, ethics and sense checks, an established review roster, witnessing, observed state and Shepherd-driven cues; do not replace them.
6. The source includes illustrative commands and assertions about scan gating. No local hook, app installation, or GitHub Actions check has been tested by this intake.
7. The PDF carries third-party source links. They require separate technical/current verification before changes to security policy.

## Current Custos Alignment

- `guides/conversation-finalization-protocol.md` already provides Locate → Thread → Motion → Seeds → Story → File → Stamp, and allows `OPEN` outcomes.
- `guides/navigo-session-kit/` covers no-API collaborators and portable receipts.
- `guides/pr-lifecycle.md` governs draft → review → finalize → Shepherd-requested merge.
- `.artesian/claim-carrier-template.md` supports claims when direct editing is unavailable.
- The existing `.github/PULL_REQUEST_TEMPLATE.md` must be preserved.

## Suggested Separate Implementation Mission (not performed here)

After verifying whether GitGuardian already runs in the repository, create a narrowly scoped security branch and test a minimal, valid configuration; only then add agent documentation, sensible exceptions and additive PR checklist entries. Never treat passing a scanner as proof that contributions are approved. Record each actual check result, including failures and unverified local hooks, in that security PR.

## Handoff Receipt

- **Origin:** externally produced multi-tab conversation PDF, supplied by the Shepherd in this ChatGPT session.
- **Contributor attribution:** originating conversation's author(s) not determined from the PDF; **pending confirmation**. Do not assign ownership or identity based on guesswork.
- **What arrived:** security architecture, proposed config examples, and reasoning about developer and AI-agent secret handling.
- **What changed:** a reviewable Custos intake proposal; no GitGuardian deployment.
- **Provenance:** source attachment held in conversation; durable raw-file Drive archive still pending.
- **Next step:** review and choose whether to archive PDF in a designated Drive staging folder, then open a separate security implementation task or PR.
- **State:** OPEN-source-archive-and-review.

*Submission is not endorsement. The original voice remains its own.*
