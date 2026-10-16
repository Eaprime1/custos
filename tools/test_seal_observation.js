// Offline test for the observation rule in the seal ("Finalize PR" step of
// .github/workflows/finalize-pr.yml). The step's script is passed as a file path.
// It runs with fake GitHub calls, so nothing touches the network.
// Run: bash tools/test_seal_observation.sh

const fs = require('node:fs');

const run = eval(`(async ({ github, context, core }) => {${fs.readFileSync(process.argv[2], 'utf8')}})`);
const OBS = 'turns/observations/202610160316_pr5_observation.md';

function fake(files, text) {
  const comments = [];
  const pr = { body: '## Intent\nreal intent text\n## What Arrived\nsomething arrived\n## Resonance\nresonant text', head: { sha: 'h1' } };
  const github = {
    rest: {
      pulls: { get: async () => ({ data: pr }), listFiles: 'files' },
      checks: { listForRef: 'checks' },
      issues: { createComment: async (a) => { comments.push(a.body); }, listComments: 'comments' },
      repos: { getContent: async () => ({ data: { content: Buffer.from(text || '').toString('base64') } }) },
    },
    graphql: async () => ({ repository: { pullRequest: { reviewThreads: { nodes: [], pageInfo: { hasNextPage: false } } } } }),
    paginate: async (f) => {
      if (f === 'files') return files.map((filename) => ({ filename }));
      return f === 'checks' ? [{ name: 'ok', status: 'completed', conclusion: 'success' }] : [];
    },
  };
  return { github, comments };
}

async function blockedBy(files, text, actor) {
  const { github, comments } = fake(files, text);
  const context = { repo: { owner: 'o', repo: 'r' }, issue: { number: 5 }, actor, payload: { comment: { created_at: '2026-10-16T10:00:00Z', id: 1 } } };
  await run({ github, context, core: { info() {} } }).catch(() => {});
  const blocked = comments.find((b) => b.includes('not yet sealed'));
  return blocked ? blocked.split('\n').filter((l) => l.includes('observation') || l.includes('Observation')).length > 0 : false;
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
    const got = await blockedBy(files, text, actor);
    if (got !== want) { failed += 1; process.stdout.write(`FAIL ${name}: blocked ${got}, want ${want}\n`); }
  }
  process.stdout.write(`${rows.length - failed} of ${rows.length} passed\n`);
  process.exit(failed ? 1 : 0);
})();
