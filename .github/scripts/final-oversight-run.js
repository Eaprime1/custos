'use strict';
// Gathers the facts for one PR and hands them to final-oversight.js.
// Called from .github/workflows/final-oversight.yml (the BASE branch copy).
const fs = require('fs');

module.exports = async function run({ github, context, core, fo }) {

  const { owner, repo } = context.repo;
  const pr = context.payload.pull_request;
  const number = pr.number;
  const head = pr.head.sha;

  // 1. checks and statuses on the head (this job's own check is left out)
  const runs = await github.paginate(github.rest.checks.listForRef, { owner, repo, ref: head, per_page: 100 });
  const combined = await github.rest.repos.getCombinedStatusForRef({ owner, repo, ref: head, per_page: 100 });
  const checks = fo.evaluateChecks({
    runs: runs.map((r) => ({ name: r.name, status: r.status, conclusion: r.conclusion })),
    statuses: combined.data.statuses.map((s) => ({ context: s.context, state: s.state })),
    selfName: 'final-oversight',
  });

  // 2. review threads
  const q = await github.graphql(
    `query($o:String!,$r:String!,$n:Int!){repository(owner:$o,name:$r){pullRequest(number:$n){reviewThreads(first:100){nodes{isResolved}}}}}`,
    { o: owner, r: repo, n: number });
  const threads = fo.evaluateThreads(q.repository.pullRequest.reviewThreads.nodes);

  // 3. does the seal cover this head?
  const comments = await github.paginate(github.rest.issues.listComments, { owner, repo, issue_number: number, per_page: 100 });
  const seals = comments.filter((c) => c.user && c.user.login === 'github-actions[bot]' && c.body.includes('<!-- witnesses:seal-record'));
  const sealAt = seals.length ? seals[seals.length - 1].created_at : null;
  const prCommits = await github.paginate(github.rest.pulls.listCommits, { owner, repo, pull_number: number, per_page: 100 });
  const after = sealAt ? prCommits.filter((c) => Date.parse(c.commit.committer.date) > Date.parse(sealAt)) : [];
  const detailed = [];
  for (const c of after) {
    const full = await github.rest.repos.getCommit({ owner, repo, ref: c.sha });
    detailed.push({
      sha: c.sha,
      date: c.commit.committer.date,
      authorLogin: c.author ? c.author.login : '',
      files: (full.data.files || []).map((f) => f.filename),
    });
  }
  const post = fo.evaluatePostSeal({ sealAt, commits: detailed });

  // 4. the observation for this PR
  const files = await github.paginate(github.rest.pulls.listFiles, { owner, repo, pull_number: number, per_page: 100 });
  const names = files.map((f) => f.filename);
  const found = fo.findObservation(names, number);
  const obsPath = found.length ? found[found.length - 1] : null;
  let obs = { ok: false, problems: ['no observation file'] };
  if (obsPath) {
    const got = await github.rest.repos.getContent({ owner, repo, path: obsPath, ref: head });
    obs = fo.evaluateObservation(Buffer.from(got.data.content, 'base64').toString('utf8'));
  }

  // 5. watched paths and the stale-claims line
  const watched = fo.watchedPaths(names);
  const unnamed = fo.unnamedWatched(watched, pr.body || '');
  const stale = fo.parseStale(fs.readFileSync('stale.txt', 'utf8'));

  const body = fo.render({ head, checks, threads, post, obs, obsPath, watched, unnamed, stale });
  const mine = comments.find((c) => c.user && c.user.type === 'Bot' && c.body.startsWith(fo.MARK));
  if (mine) {
    await github.rest.issues.updateComment({ owner, repo, comment_id: mine.id, body });
  } else {
    await github.rest.issues.createComment({ owner, repo, issue_number: number, body });
  }
  core.summary.addRaw(body).write();

  if (fo.hardFail({ checks, threads, post, obs, obsPath })) {
    core.setFailed('Final oversight found something that needs attention. See the comment on the PR.');
  }
};
