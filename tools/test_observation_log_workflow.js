// Runs the real github-script step from .github/workflows/observation-log.yml against a
// stubbed GitHub. No network. The script text is extracted by test_observation_log.sh
// (PyYAML reads the workflow) and piped in on stdin, so the test cannot drift from the
// workflow it covers.
// Run: bash tools/test_observation_log.sh

const fs = require('node:fs');

process.env.TZ = 'America/Los_Angeles';

const { say, makeChecker } = require('./observation_log_test_kit.js');

const { check, report } = makeChecker('workflow checks');

const script = fs.readFileSync('/dev/stdin', 'utf8');
if (!script.trim()) { say('usage: pipe the workflow step script in on stdin'); process.exit(2); }
// github-script runs a step as the body of an async function; this reaches the same
// constructor. The function below is never called, it only has to be a real async one.
const AsyncFunction = Object.getPrototypeOf(async () => { await null; }).constructor;
const run = new AsyncFunction('github', 'context', 'core', 'require', script);
// The only module the step loads. A literal require, so the test reaches nothing else.
const observationLog = require('../.github/scripts/observation-log.js');
const rootRequire = (name) => {
  if (name !== './.github/scripts/observation-log.js') throw new Error(`unexpected require: ${name}`);
  return observationLog;
};

// A stand-in for the pieces of the GitHub API the step touches.
function makeWorld({ comments = [], headSha = 'feedface1234567', reviewComments = [] } = {}) {
  const world = { comments: [...comments], calls: [], logs: [], nextId: 5000 };
  const rest = {
    pulls: {
      listCommentsForReview: () => { world.calls.push('listCommentsForReview'); return Promise.resolve(reviewComments); },
      get: () => { world.calls.push('pulls.get'); return Promise.resolve({ data: { head: { sha: headSha } } }); },
    },
    issues: {
      listComments: () => { world.calls.push('listComments'); return Promise.resolve(world.comments); },
      createComment: ({ issue_number, body }) => {
        world.calls.push('createComment');
        world.nextId += 1;
        world.comments.push({ id: world.nextId, body, user: { type: 'Bot' }, issue_number });
        return Promise.resolve({});
      },
      updateComment: ({ comment_id, body }) => {
        world.calls.push('updateComment');
        world.comments.find((c) => c.id === comment_id).body = body;
        return Promise.resolve({});
      },
    },
  };
  world.github = { rest, paginate: (fn, args) => fn(args) };
  world.core = {
    info: (m) => { world.logs.push(m); },
    warning: (m) => { world.logs.push(`warning: ${m}`); },
    setFailed: (m) => { world.failed = m; },
  };
  return world;
}
const writes = (world) => world.calls.filter((call) => call === 'createComment' || call === 'updateComment');
const ownerUser = { login: 'Eaprime1', type: 'User' };
const ctx = (eventName, payload) => ({ eventName, payload, repo: { owner: 'Eaprime1', repo: 'custos' } });
const go = (world, eventName, payload) => run(world.github, ctx(eventName, payload), world.core, rootRequire);

const review = (over = {}) => ({
  action: 'submitted', pull_request: { number: 462 },
  review: { id: 11, body: 'shepherd observation 202610171254', user: ownerUser, author_association: 'OWNER',
    submitted_at: '2026-10-17T21:54:00Z', commit_id: 'abc1234def5678', html_url: 'https://github.com/o/r/pull/462#pullrequestreview-11', ...over },
});
const prComment = (over = {}) => ({
  action: 'created', issue: { number: 462, pull_request: { url: 'x' } },
  comment: { id: 77, body: 'shepherd observation 202610171600\nsecond note', user: ownerUser, author_association: 'OWNER',
    created_at: '2026-10-17T23:00:00Z', html_url: 'https://github.com/o/r/pull/462#issuecomment-77', ...over },
});
const rowIds = (body) => (body.match(/<!--obs:([a-z]+-\d+)-->/g) || []).map((s) => s.slice(8, -3));

async function scenario0() {
  // 1. A review opens the log; its inline comments are looked up; no head lookup is needed.
  const world = makeWorld({ reviewComments: [{ html_url: 'https://github.com/o/r/pull/462#discussion_r1' }, { html_url: 'https://github.com/o/r/pull/462#discussion_r2' }] });
  await go(world, 'pull_request_review', review());
  check('review: one comment is created', writes(world).join() === 'createComment', world.calls.join());
  check('review: inline comments were looked up', world.calls.includes('listCommentsForReview'));
  check('review: no head lookup (the review knows its commit)', !world.calls.includes('pulls.get'));
  const body = world.comments[0]?.body;
  check('review: the log carries its marker first', Boolean(body) && body.startsWith('<!-- custos-observation-log -->'));
  check('review: both clocks are in the row', Boolean(body) && body.includes('| 202610172154 | 202610171254 |'), body);
  check('review: inline comments are counted', Boolean(body) && body.includes('2 inline:'));
  check('review: it was posted to the PR number from the payload', world.comments[0] && world.comments[0].issue_number === 462);
  check('review: nothing failed', !world.failed);
  check('review: it says it opened the log', world.logs.some((m) => m.startsWith('Opened the observation log (review-11)')), world.logs.join(' | '));
}

async function scenario1() {
  // 2. A PR comment has no commit; the head is asked for. Then a second row joins the first.
  const world = makeWorld();
  await go(world, 'pull_request_review', review());
  await go(world, 'issue_comment', prComment());
  check('second event updates, it does not open another comment', writes(world).join() === 'createComment,updateComment' && world.comments.length === 1, writes(world).join());
  check('second event says it updated the log', world.logs.some((m) => m.startsWith('Updated the observation log (comment-77)')), world.logs.join(' | '));
  check('PR comment: the head was asked for', world.calls.includes('pulls.get'));
  check('PR comment: the log now has both rows in order', rowIds(world.comments[0].body).join() === 'review-11,comment-77', rowIds(world.comments[0].body).join());
  check('PR comment: the head comes from the API', world.comments[0].body.includes('`feedfac`'));
  // 3. An edit replaces its row and does not add one.
  await go(world, 'pull_request_review', { ...review({ body: 'shepherd observation 202610171254\nrename it' }), action: 'edited' });
  check('edit: still two rows', rowIds(world.comments[0].body).length === 2, rowIds(world.comments[0].body).join());
  check('edit: the new words are there and flagged', world.comments[0].body.includes('rename it') && world.comments[0].body.includes('edited'));
  check('edit: order is kept', rowIds(world.comments[0].body).join() === 'review-11,comment-77');
}

async function scenario2() {
  // 4. Things that must not be recorded.
  const quiet = async (name, eventName, payload, opts) => {
  const world = makeWorld(opts);
  await go(world, eventName, payload);
  check(`skipped: ${name}`, writes(world).length === 0 && !world.failed, world.calls.join() || '(no calls)');
  };
  await quiet('no marker', 'issue_comment', prComment({ body: 'looks fine to me' }));
  await quiet('a navigo comment with the footer', 'issue_comment', prComment({ body: 'shepherd observation 202610171600\n\n---\n_Generated by [Claude Code](https://claude.ai/code)_' }));
  await quiet('a bot', 'issue_comment', prComment({ user: { login: 'x[bot]', type: 'Bot' } }));
  await quiet('not the owner', 'issue_comment', prComment({ author_association: 'CONTRIBUTOR' }));
  await quiet('quoted', 'issue_comment', prComment({ body: '> shepherd observation 202610171600' }));
  await quiet('in code', 'issue_comment', prComment({ body: '`shepherd observation 202610171600`' }));
  await quiet('a comment on a plain issue', 'issue_comment', { action: 'created', issue: { number: 3 }, comment: prComment().comment });
  await quiet('an event it does not read', 'push', {});
}

async function scenario3() {
  // 5. Someone else's comment that happens to start with the marker is not our log.
  const world = makeWorld({ comments: [{ id: 1, body: '<!-- custos-observation-log -->\nlooks like ours', user: { type: 'User' } }] });
  await go(world, 'issue_comment', prComment());
  check('a human comment that starts with the marker is not ours', writes(world).join() === 'createComment' && world.comments.length === 2, writes(world).join());
  check('and it is left alone', world.comments[0].body.includes('looks like ours') && !world.comments[0].body.includes('obs:'));
}

async function scenario4() {
  // 6. Rows already in the log are kept when it is rewritten.
  const world = makeWorld();
  await go(world, 'pull_request_review', review());
  await go(world, 'pull_request_review_comment', {
    action: 'created', pull_request: { number: 462 },
    comment: { id: 901, body: 'shepherd observation\nthis line', user: ownerUser, author_association: 'OWNER',
      created_at: '2026-10-17T21:55:00Z', commit_id: 'abc1234def5678', html_url: 'https://github.com/o/r/pull/462#discussion_r901' },
  });
  check('a review comment is recorded alongside the review', rowIds(world.comments[0].body).join() === 'review-11,rcomment-901', rowIds(world.comments[0].body).join());
  check('an unstamped observation shows a dash', world.comments[0].body.includes('| — |'));
}

const SCENARIOS = [scenario0, scenario1, scenario2, scenario3, scenario4];

// Each scenario runs on its own, so one that throws is reported and the rest still run.
async function runAll() {
  for (const scenario of SCENARIOS) {
    try {
      await scenario();
    } catch (e) {
      check(`${scenario.name} ran without throwing`, false, e.stack || String(e));
    }
  }
  process.exit(report());
}

runAll();
