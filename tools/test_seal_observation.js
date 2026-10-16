// Offline test for the observation rule in the seal ("Finalize PR" step of
// .github/workflows/finalize-pr.yml). The shell wrapper writes the step's script into
// tools/.seal-gate.generated.js, which is not committed. It runs with fake GitHub
// calls, so nothing touches the network. Run: bash tools/test_seal_observation.sh

const run = require('./.seal-gate.generated.js');

const OBS = 'turns/observations/202610160316_pr5_observation.md';
const PR = {
  body: '## Intent\nreal intent text\n## What Arrived\nsomething arrived\n## Resonance\nresonant text',
  head: { sha: 'h1' },
};
const NO_THREADS = { repository: { pullRequest: { reviewThreads: { nodes: [], pageInfo: { hasNextPage: false } } } } };

// The fakes return plain values: the script awaits them, and await accepts any value.
function fake(files, text) {
  const comments = [];
  const content = Buffer.from(text || '').toString('base64');
  const github = {
    rest: {
      pulls: { get: () => ({ data: PR }), listFiles: 'files' },
      checks: { listForRef: 'checks' },
      issues: { createComment: (a) => comments.push(a.body), listComments: 'comments' },
      repos: { getContent: () => ({ data: { content } }) },
    },
    graphql: () => NO_THREADS,
    paginate: (f) => {
      if (f === 'files') return files.map((filename) => ({ filename }));
      return f === 'checks' ? [{ name: 'ok', status: 'completed', conclusion: 'success' }] : [];
    },
  };
  return { github, comments };
}

async function blockedByObservation(files, text, actor) {
  const { github, comments } = fake(files, text);
  const context = {
    repo: { owner: 'o', repo: 'r' },
    issue: { number: 5 },
    actor,
    payload: { comment: { created_at: '2026-10-16T10:00:00Z', id: 1 } },
  };
  const errors = [];
  const core = { info: (msg) => errors.push(msg) };
  await run({ github, context, core }).catch((e) => errors.push(e.message));
  const blocked = comments.find((b) => b.includes('not yet sealed'));
  return Boolean(blocked) && /observation/i.test(blocked);
}

const rows = [
  ['no observation filed, owner', ['a.md'], '', 'eaprime1', true],
  ['observation still open', [OBS], 'status: open\n', 'eaprime1', true],
  ['observation without a status', [OBS], '## Seen\n', 'eaprime1', true],
  ['observation complete', [OBS], 'status: complete\n', 'eaprime1', false],
  ['status word in capitals', [OBS], 'status: Complete\n', 'eaprime1', false],
  ['a bot is not asked', ['a.md'], '', 'github-actions[bot]', false],
  ['another PR number', ['turns/observations/202610160316_pr6_observation.md'], 'status: complete\n', 'eaprime1', true],
  ['short stamp', ['turns/observations/2026101603_pr5_observation.md'], 'status: complete\n', 'eaprime1', true],
  ['wrong folder', ['elsewhere/202610160316_pr5_observation.md'], 'status: complete\n', 'eaprime1', true],
];

(async () => {
  let failed = 0;
  for (const [name, files, text, actor, want] of rows) {
    const got = await blockedByObservation(files, text, actor);
    if (got !== want) {
      failed += 1;
      process.stdout.write(`FAIL ${name}: blocked ${got}, want ${want}\n`);
    }
  }
  process.stdout.write(`${rows.length - failed} of ${rows.length} passed\n`);
  process.exit(failed ? 1 : 0);
})();
