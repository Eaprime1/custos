'use strict';
// Runs the real github-script step from .github/workflows/observation-log.yml against a
// stubbed GitHub. No network. The script text is extracted by test_observation_log.sh
// (PyYAML reads the workflow) and passed in as a file, so the test cannot drift from the
// workflow it covers.
// Run: bash tools/test_observation_log.sh

const fs = require('fs');
const path = require('path');

process.env.TZ = 'America/Los_Angeles';

const scriptPath = process.argv[2];
if (!scriptPath) { console.error('usage: node test_observation_log_workflow.js <script-file>'); process.exit(2); }
const script = fs.readFileSync(scriptPath, 'utf8');
const AsyncFunction = Object.getPrototypeOf(async function () {}).constructor;
const run = new AsyncFunction('github', 'context', 'core', 'require', script);
const rootRequire = (p) => require(path.resolve(p));

let failed = 0;
let count = 0;
function check(name, ok, detail) {
  count += 1;
  if (!ok) { failed += 1; console.log(`FAIL  ${name}${detail ? `  ${detail}` : ''}`); }
}

// A stand-in for the pieces of the GitHub API the step touches.
function makeWorld({ comments = [], headSha = 'feedface1234567', reviewComments = [] } = {}) {
  const world = { comments: [...comments], calls: [], nextId: 5000 };
  const rest = {
    pulls: {
      listCommentsForReview: async () => { world.calls.push('listCommentsForReview'); return reviewComments; },
      get: async () => { world.calls.push('pulls.get'); return { data: { head: { sha: headSha } } }; },
    },
    issues: {
      listComments: async () => { world.calls.push('listComments'); return world.comments; },
      createComment: async ({ issue_number, body }) => {
        world.calls.push('createComment');
        world.comments.push({ id: world.nextId += 1, body, user: { type: 'Bot' }, issue_number });
        return {};
      },
      updateComment: async ({ comment_id, body }) => {
        world.calls.push('updateComment');
        world.comments.find((c) => c.id === comment_id).body = body;
        return {};
      },
    },
  };
  world.github = { rest, paginate: async (fn, args) => fn(args) };
  world.core = { info: () => {}, warning: () => {}, setFailed: (m) => { world.failed = m; } };
  return world;
}
const writes = (w) => w.calls.filter((c) => c === 'createComment' || c === 'updateComment');
const ownerUser = { login: 'Eaprime1', type: 'User' };
const ctx = (eventName, payload) => ({ eventName, payload, repo: { owner: 'Eaprime1', repo: 'custos' } });
const go = (w, eventName, payload) => run(w.github, ctx(eventName, payload), w.core, rootRequire);

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

(async () => {
  // 1. A review opens the log; its inline comments are looked up; no head lookup is needed.
  {
    const w = makeWorld({ reviewComments: [{ html_url: 'https://github.com/o/r/pull/462#discussion_r1' }, { html_url: 'https://github.com/o/r/pull/462#discussion_r2' }] });
    await go(w, 'pull_request_review', review());
    check('review: one comment is created', writes(w).join() === 'createComment', w.calls.join());
    check('review: inline comments were looked up', w.calls.includes('listCommentsForReview'));
    check('review: no head lookup (the review knows its commit)', !w.calls.includes('pulls.get'));
    const body = w.comments[0] && w.comments[0].body;
    check('review: the log carries its marker first', !!body && body.startsWith('<!-- custos-observation-log -->'));
    check('review: both clocks are in the row', !!body && body.includes('| 202610172154 | 202610171254 |'), body);
    check('review: inline comments are counted', !!body && body.includes('2 inline:'));
    check('review: it was posted to the PR number from the payload', w.comments[0] && w.comments[0].issue_number === 462);
    check('review: nothing failed', !w.failed);
  }
  // 2. A PR comment has no commit; the head is asked for. Then a second row joins the first.
  {
    const w = makeWorld();
    await go(w, 'pull_request_review', review());
    await go(w, 'issue_comment', prComment());
    check('second event updates, it does not open another comment', writes(w).join() === 'createComment,updateComment' && w.comments.length === 1, writes(w).join());
    check('PR comment: the head was asked for', w.calls.includes('pulls.get'));
    check('PR comment: the log now has both rows in order', rowIds(w.comments[0].body).join() === 'review-11,comment-77', rowIds(w.comments[0].body).join());
    check('PR comment: the head comes from the API', w.comments[0].body.includes('`feedfac`'));
    // 3. An edit replaces its row and does not add one.
    await go(w, 'pull_request_review', { ...review({ body: 'shepherd observation 202610171254\nrename it' }), action: 'edited' });
    check('edit: still two rows', rowIds(w.comments[0].body).length === 2, rowIds(w.comments[0].body).join());
    check('edit: the new words are there and flagged', w.comments[0].body.includes('rename it') && w.comments[0].body.includes('edited'));
    check('edit: order is kept', rowIds(w.comments[0].body).join() === 'review-11,comment-77');
  }
  // 4. Things that must not be recorded.
  const quiet = async (name, eventName, payload, opts) => {
    const w = makeWorld(opts);
    await go(w, eventName, payload);
    check(`skipped: ${name}`, writes(w).length === 0 && !w.failed, w.calls.join() || '(no calls)');
  };
  await quiet('no marker', 'issue_comment', prComment({ body: 'looks fine to me' }));
  await quiet('a navigo comment with the footer', 'issue_comment', prComment({ body: 'shepherd observation 202610171600\n\n---\n_Generated by [Claude Code](https://claude.ai/code)_' }));
  await quiet('a bot', 'issue_comment', prComment({ user: { login: 'x[bot]', type: 'Bot' } }));
  await quiet('not the owner', 'issue_comment', prComment({ author_association: 'CONTRIBUTOR' }));
  await quiet('quoted', 'issue_comment', prComment({ body: '> shepherd observation 202610171600' }));
  await quiet('in code', 'issue_comment', prComment({ body: '`shepherd observation 202610171600`' }));
  await quiet('a comment on a plain issue', 'issue_comment', { action: 'created', issue: { number: 3 }, comment: prComment().comment });
  await quiet('an event it does not read', 'push', {});
  // 5. Someone else's comment that happens to start with the marker is not our log.
  {
    const w = makeWorld({ comments: [{ id: 1, body: '<!-- custos-observation-log -->\nlooks like ours', user: { type: 'User' } }] });
    await go(w, 'issue_comment', prComment());
    check('a human comment that starts with the marker is not ours', writes(w).join() === 'createComment' && w.comments.length === 2, writes(w).join());
    check('and it is left alone', w.comments[0].body.includes('looks like ours') && !w.comments[0].body.includes('obs:'));
  }
  // 6. Rows already in the log are kept when it is rewritten.
  {
    const w = makeWorld();
    await go(w, 'pull_request_review', review());
    await go(w, 'pull_request_review_comment', {
      action: 'created', pull_request: { number: 462 },
      comment: { id: 901, body: 'shepherd observation\nthis line', user: ownerUser, author_association: 'OWNER',
        created_at: '2026-10-17T21:55:00Z', commit_id: 'abc1234def5678', html_url: 'https://github.com/o/r/pull/462#discussion_r901' },
    });
    check('a review comment is recorded alongside the review', rowIds(w.comments[0].body).join() === 'review-11,rcomment-901', rowIds(w.comments[0].body).join());
    check('an unstamped observation shows a dash', w.comments[0].body.includes('| — |'));
  }

  console.log(`${count - failed} of ${count} workflow checks passed`);
  process.exit(failed ? 1 : 0);
})().catch((e) => { console.log(`FAIL  the step threw: ${e.stack || e}`); process.exit(1); });
