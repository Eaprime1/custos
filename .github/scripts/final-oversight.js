// Final oversight: the pure checks behind .github/workflows/final-oversight.yml.
//
// Nothing here calls GitHub. The workflow gathers the facts (check runs, review
// threads, comments, commits, files, the observation text) and hands them to
// these functions, so tools/test_final_oversight.js can run every rule offline.
//
// The gate reports. It never seals, never merges, never edits the PR.

const OK_CONCLUSIONS = ['success', 'skipped', 'neutral'];
const BAD_CONCLUSIONS = ['failure', 'cancelled', 'timed_out', 'action_required', 'startup_failure', 'stale'];

// One check run -> 'ok', 'bad' or 'pending'.
function runState(r) {
  if (r.status !== 'completed') return 'pending';
  if (OK_CONCLUSIONS.includes(r.conclusion)) return 'ok';
  return BAD_CONCLUSIONS.includes(r.conclusion) ? 'bad' : 'pending';
}

// One commit status -> 'ok', 'bad' or 'pending'.
function statusState(s) {
  if (s.state === 'success') return 'ok';
  return s.state === 'pending' ? 'pending' : 'bad';
}

// Check runs and commit statuses on the head, minus this workflow's own check.
// runs:     [{ name, status, conclusion }]
// statuses: [{ context, state }]
function evaluateChecks({ runs = [], statuses = [], selfName = '' }) {
  const bad = [];
  const pending = [];
  const sort = (state, label) => {
    if (state === 'bad') bad.push(label);
    if (state === 'pending') pending.push(label);
  };
  runs.filter((r) => r.name !== selfName).forEach((r) => {
    const state = runState(r);
    sort(state, state === 'bad' ? `${r.name} (${r.conclusion})` : r.name);
  });
  statuses.forEach((s) => {
    const state = statusState(s);
    sort(state, state === 'bad' ? `${s.context} (${s.state})` : s.context);
  });
  return { ok: bad.length === 0 && pending.length === 0, bad, pending };
}

// Review threads: any that are unresolved.
// threads: [{ isResolved }]
function evaluateThreads(threads = []) {
  const open = threads.filter((t) => !t.isResolved).length;
  return { ok: open === 0, open, total: threads.length };
}

// A bot commit that touches nothing but pr-journeys/ is the journey document
// written at the seal; it may follow the seal.
function isJourneyCommit(c) {
  const files = c.files || [];
  const journeyOnly = files.length > 0 && files.every((f) => f.startsWith('pr-journeys/'));
  return journeyOnly && c.authorLogin === 'github-actions[bot]';
}

// Commits after the latest seal that are not the journey document.
// commits: [{ sha, date, authorLogin, files: [path] }], sealAt: ISO string or null
function evaluatePostSeal({ sealAt, commits = [] }) {
  if (!sealAt) return { ok: false, sealed: false, late: [], note: 'no seal record found' };
  const sealTime = Date.parse(sealAt);
  const late = commits
    .filter((c) => Date.parse(c.date) > sealTime && !isJourneyCommit(c))
    .map((c) => c.sha.slice(0, 7));
  return { ok: late.length === 0, sealed: true, late };
}

// The observation file for this PR: turns/observations/<12 digits>_pr<N>_observation.md
// Built with string checks, not a RegExp made from a variable.
function findObservation(paths, prNumber) {
  const dir = 'turns/observations/';
  const tail = `_pr${Number(prNumber)}_observation.md`;
  return paths
    .filter((p) => p.startsWith(dir) && p.endsWith(tail))
    .filter((p) => /^\d{12}$/.test(p.slice(dir.length, p.length - tail.length)))
    .sort();
}

const REQUIRED_SECTIONS = ['## Seen', '## Carried forward', '## Scores', '## Result'];

// The rubric rows that carry a score from 0 to 3, as numbers.
function scoredRows(text) {
  const found = new Set();
  for (const m of String(text).matchAll(/\|\s*M([1-8])\b[^|]*\|\s*([0-3])\s*\|/g)) found.add(Number(m[1]));
  return found;
}

function statusProblem(text) {
  const status = (String(text).match(/^status:\s*([A-Za-z]+)/m) || [])[1];
  if (!status) return 'no "status:" line';
  return status.toLowerCase() === 'complete' ? null : `status is "${status}", not "complete"`;
}

// The observation must be complete and carry a rubric score for each of M1 to M8.
function evaluateObservation(text) {
  const problems = [statusProblem(text)].filter(Boolean);
  REQUIRED_SECTIONS.filter((h) => !String(text).includes(h))
    .forEach((h) => problems.push(`missing section "${h}"`));
  const scored = scoredRows(text);
  const missing = [1, 2, 3, 4, 5, 6, 7, 8].filter((n) => !scored.has(n));
  const labels = missing.map((n) => `M${n}`).join(', ');
  if (missing.length) problems.push(`no score (0 to 3) for ${labels}`);
  return { ok: problems.length === 0, problems };
}

// Files that need the Deck Master's eye or sit on the seal path.
const WATCHED = [
  /^vault\//, /^moav\//, /^prima-clock\//, /^branch-tracker\//, /^world\//, /^device\//,
  /^\.github\/CODEOWNERS$/,
  /^\.github\/workflows\/(finalize-pr|latin-cue-record|placet|final-oversight)\.yml$/,
  /^\.github\/scripts\/(cue-parser|final-oversight|final-oversight-run)\.js$/,
];
function watchedPaths(files = []) {
  return files.filter((f) => WATCHED.some((re) => re.test(f)));
}
// A watched path is "named" when the PR body mentions its file name or folder.
function unnamedWatched(watched, body = '') {
  const lowered = String(body).toLowerCase();
  return watched.filter((f) => {
    const base = f.split('/').pop().toLowerCase();
    const top = f.split('/')[0].toLowerCase();
    return !(lowered.includes(base) || lowered.includes(`${top}/`));
  });
}

// Advisory: the CLAUDE.md line of tools/stale_claims.sh output.
function parseStale(text) {
  const found = String(text).match(/^CLAUDE\.md: (\d+) of (\d+)/m);
  return found ? { flagged: Number(found[1]), total: Number(found[2]) } : null;
}

const MARK = '<!-- custos-final-oversight -->';
const tick = (ok) => (ok ? '✅' : '❌');
const row = (state, name, detail) => `| ${state} | ${name} | ${detail} |`;

function checksRow({ checks }) {
  const parts = [];
  if (checks.bad.length) parts.push(`failed: ${checks.bad.join(', ')}`);
  if (checks.pending.length) parts.push(`pending: ${checks.pending.join(', ')}`);
  return row(tick(checks.ok), 'Checks and statuses on the head', checks.ok ? 'all green' : parts.join('; '));
}

function threadsRow({ threads }) {
  const detail = threads.ok ? `none open (${threads.total} total)` : `${threads.open} open of ${threads.total}`;
  return row(tick(threads.ok), 'Review threads', detail);
}

function sealRow({ post }) {
  let detail = `commits after the seal: ${post.late.join(', ')}`;
  if (!post.sealed) detail = 'no seal record on the PR';
  else if (post.ok) detail = 'only the journey document follows the seal';
  return row(tick(post.ok), 'Seal covers this head', detail);
}

function observationRow({ obs, obsPath }) {
  let detail = 'no observation file for this PR';
  if (obsPath) detail = obs.ok ? `\`${obsPath}\`: complete, M1 to M8 scored` : `\`${obsPath}\`: ${obs.problems.join('; ')}`;
  return row(tick(obs.ok && Boolean(obsPath)), 'Observation complete', detail);
}

function watchedRow({ watched, unnamed }) {
  let detail = 'none touched';
  if (watched.length) {
    detail = unnamed.length
      ? `${watched.length} touched; not named in the PR body: ${unnamed.join(', ')}`
      : `${watched.length} touched, all named in the PR body`;
  }
  return row(unnamed.length ? '⚠️' : 'ℹ️', 'Watched paths (Deck Master or seal path)', detail);
}

function staleRow({ stale }) {
  const detail = stale ? `${stale.flagged} of ${stale.total} path-like names in CLAUDE.md not in the tree` : 'not run';
  return row('ℹ️', 'Stale claims (advisory)', detail);
}

// facts: { head, checks, threads, post, obs, obsPath, watched, unnamed, stale }
function render(facts) {
  return [
    MARK,
    `## Final oversight — head \`${facts.head.slice(0, 7)}\``,
    '',
    '*Report only. This does not seal and does not merge. The owner approved this run.*',
    '',
    '| | Check | Detail |',
    '|---|---|---|',
    checksRow(facts),
    threadsRow(facts),
    sealRow(facts),
    observationRow(facts),
    watchedRow(facts),
    staleRow(facts),
    '',
  ].join('\n');
}

// facts: the same object; true when a must-pass check failed.
function hardFail(facts) {
  const passes = [facts.checks.ok, facts.threads.ok, facts.post.ok, facts.obs.ok, Boolean(facts.obsPath)];
  return !passes.every(Boolean);
}

module.exports = {
  MARK, evaluateChecks, evaluateThreads, evaluatePostSeal, findObservation,
  evaluateObservation, watchedPaths, unnamedWatched, parseStale, render, hardFail,
};
