'use strict';
// Final oversight: the pure checks behind .github/workflows/final-oversight.yml.
//
// Nothing here calls GitHub. The workflow gathers the facts (check runs, review
// threads, comments, commits, files, the observation text) and hands them to
// these functions, so tools/test_final_oversight.js can run every rule offline.
//
// The gate reports. It never seals, never merges, never edits the PR.

const OK_CONCLUSIONS = ['success', 'skipped', 'neutral'];
const BAD_CONCLUSIONS = ['failure', 'cancelled', 'timed_out', 'action_required', 'startup_failure', 'stale'];

// Check runs and commit statuses on the head, minus this workflow's own check.
// runs:     [{ name, status, conclusion }]
// statuses: [{ context, state }]
function evaluateChecks({ runs = [], statuses = [], selfName = '' }) {
  const bad = [];
  const pending = [];
  for (const r of runs) {
    if (selfName && r.name === selfName) continue;
    if (r.status !== 'completed') { pending.push(r.name); continue; }
    if (OK_CONCLUSIONS.includes(r.conclusion)) continue;
    if (BAD_CONCLUSIONS.includes(r.conclusion)) { bad.push(`${r.name} (${r.conclusion})`); continue; }
    pending.push(`${r.name} (${r.conclusion || 'no conclusion'})`);
  }
  for (const s of statuses) {
    if (s.state === 'success') continue;
    if (s.state === 'pending') { pending.push(s.context); continue; }
    bad.push(`${s.context} (${s.state})`);
  }
  return { ok: bad.length === 0 && pending.length === 0, bad, pending };
}

// Review threads: any that are unresolved and not outdated-and-resolved.
// threads: [{ isResolved }]
function evaluateThreads(threads = []) {
  const open = threads.filter((t) => !t.isResolved).length;
  return { ok: open === 0, open, total: threads.length };
}

// Commits after the latest seal. Only a bot commit that touches nothing but
// pr-journeys/ (the journey document written at the seal) is allowed after it.
// commits: [{ sha, date, authorLogin, files: [path] }], sealAt: ISO string or null
function evaluatePostSeal({ sealAt, commits = [] }) {
  if (!sealAt) return { ok: false, sealed: false, late: [], note: 'no seal record found' };
  const t = Date.parse(sealAt);
  const late = [];
  for (const c of commits) {
    if (Date.parse(c.date) <= t) continue;
    const journeyOnly = (c.files || []).length > 0 && c.files.every((f) => f.startsWith('pr-journeys/'));
    const bot = c.authorLogin === 'github-actions[bot]';
    if (!(bot && journeyOnly)) late.push(c.sha.slice(0, 7));
  }
  return { ok: late.length === 0, sealed: true, late };
}

// The observation file for this PR: turns/observations/<12 digits>_pr<N>_observation.md
function findObservation(paths, prNumber) {
  const re = new RegExp(`^turns/observations/\\d{12}_pr${Number(prNumber)}_observation\\.md$`);
  return paths.filter((p) => re.test(p)).sort();
}

// The observation must be complete and carry a rubric score for each of M1 to M8.
function evaluateObservation(text) {
  const problems = [];
  const status = (String(text).match(/^status:\s*([A-Za-z]+)/m) || [])[1];
  if (!status) problems.push('no "status:" line');
  else if (status.toLowerCase() !== 'complete') problems.push(`status is "${status}", not "complete"`);
  for (const h of ['## Seen', '## Carried forward', '## Scores', '## Result']) {
    if (!String(text).includes(h)) problems.push(`missing section "${h}"`);
  }
  const scored = new Set();
  for (const m of String(text).matchAll(/\|\s*M([1-8])\b[^|]*\|\s*([0-3])\s*\|/g)) scored.add(m[1]);
  const missing = [1, 2, 3, 4, 5, 6, 7, 8].filter((n) => !scored.has(String(n)));
  if (missing.length) problems.push(`no score (0 to 3) for ${missing.map((n) => 'M' + n).join(', ')}`);
  return { ok: problems.length === 0, problems };
}

// Files that need the Deck Master's eye or sit on the seal path.
const WATCHED = [
  /^vault\//, /^moav\//, /^prima-clock\//, /^branch-tracker\//, /^world\//, /^device\//,
  /^\.github\/CODEOWNERS$/,
  /^\.github\/workflows\/(finalize-pr|latin-cue-record|placet|final-oversight)\.yml$/,
  /^\.github\/scripts\/(cue-parser|final-oversight)\.js$/,
];
function watchedPaths(files = []) {
  return files.filter((f) => WATCHED.some((re) => re.test(f)));
}
// A watched path is "named" when the PR body mentions its file name or folder.
function unnamedWatched(watched, body = '') {
  const b = String(body).toLowerCase();
  return watched.filter((f) => {
    const base = f.split('/').pop().toLowerCase();
    const top = f.split('/')[0].toLowerCase();
    return !(b.includes(base) || b.includes(top + '/'));
  });
}

// Advisory: the last line of tools/stale_claims.sh output for CLAUDE.md.
function parseStale(text) {
  const m = String(text).match(/^CLAUDE\.md: (\d+) of (\d+)/m);
  return m ? { flagged: Number(m[1]), total: Number(m[2]) } : null;
}

const MARK = '<!-- custos-final-oversight -->';

function render({ head, checks, threads, post, obs, obsPath, watched, unnamed, stale }) {
  const row = (state, name, detail) => `| ${state} | ${name} | ${detail} |`;
  const tick = (ok) => (ok ? '✅' : '❌');
  const lines = [
    MARK,
    `## Final oversight — head \`${head.slice(0, 7)}\``,
    '',
    '*Report only. This does not seal and does not merge. The owner approved this run.*',
    '',
    '| | Check | Detail |',
    '|---|---|---|',
    row(tick(checks.ok), 'Checks and statuses on the head',
      checks.ok ? 'all green' : [checks.bad.length ? `failed: ${checks.bad.join(', ')}` : '', checks.pending.length ? `pending: ${checks.pending.join(', ')}` : ''].filter(Boolean).join('; ')),
    row(tick(threads.ok), 'Review threads', threads.ok ? `none open (${threads.total} total)` : `${threads.open} open of ${threads.total}`),
    row(tick(post.ok), 'Seal covers this head',
      !post.sealed ? 'no seal record on the PR' : post.ok ? 'only the journey document follows the seal' : `commits after the seal: ${post.late.join(', ')}`),
    row(tick(obs.ok), 'Observation complete',
      obsPath ? (obs.ok ? `\`${obsPath}\`: complete, M1 to M8 scored` : `\`${obsPath}\`: ${obs.problems.join('; ')}`) : 'no observation file for this PR'),
    row(unnamed.length ? '⚠️' : 'ℹ️', 'Watched paths (Deck Master or seal path)',
      watched.length ? `${watched.length} touched${unnamed.length ? `; not named in the PR body: ${unnamed.join(', ')}` : ', all named in the PR body'}` : 'none touched'),
    row('ℹ️', 'Stale claims (advisory)', stale ? `${stale.flagged} of ${stale.total} path-like names in CLAUDE.md not in the tree` : 'not run'),
    '',
  ];
  return lines.join('\n');
}

function hardFail({ checks, threads, post, obs, obsPath }) {
  return !(checks.ok && threads.ok && post.ok && obs.ok && obsPath);
}

module.exports = {
  MARK, evaluateChecks, evaluateThreads, evaluatePostSeal, findObservation,
  evaluateObservation, watchedPaths, unnamedWatched, parseStale, render, hardFail,
};
