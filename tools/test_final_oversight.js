// Offline test table for .github/scripts/final-oversight.js. Needs node; no network.
const fo = require('../.github/scripts/final-oversight.js');

let failed = 0;
let total = 0;
const say = (s) => process.stdout.write(`${s}\n`);
function check(name, got, want) {
  total += 1;
  const gotJson = JSON.stringify(got);
  const wantJson = JSON.stringify(want);
  if (gotJson !== wantJson) { failed += 1; say(`FAIL: ${name}\n  got  ${gotJson}\n  want ${wantJson}`); }
}

// ── checks and statuses ─────────────────────────────────────────────
const run = (name, status, conclusion) => ({ name, status, conclusion });
check('all green', fo.evaluateChecks({ runs: [run('a', 'completed', 'success'), run('b', 'completed', 'skipped')], statuses: [{ context: 's', state: 'success' }] }).ok, true);
check('failure is bad', fo.evaluateChecks({ runs: [run('a', 'completed', 'failure')] }).bad, ['a (failure)']);
check('action_required is bad', fo.evaluateChecks({ runs: [run('a', 'completed', 'action_required')] }).bad, ['a (action_required)']);
check('in progress is pending', fo.evaluateChecks({ runs: [run('a', 'in_progress', null)] }).pending, ['a']);
check('queued is pending', fo.evaluateChecks({ runs: [run('a', 'queued', null)] }).ok, false);
check('own check is ignored', fo.evaluateChecks({ runs: [run('gate', 'in_progress', null)], selfName: 'gate' }).ok, true);
check('pending status', fo.evaluateChecks({ statuses: [{ context: 'DeepSource: Swift', state: 'pending' }] }).pending, ['DeepSource: Swift']);
check('error status is bad', fo.evaluateChecks({ statuses: [{ context: 'x', state: 'error' }] }).bad, ['x (error)']);
check('no checks at all is ok', fo.evaluateChecks({}).ok, true);

check('completed with an odd conclusion is pending', fo.evaluateChecks({ runs: [run('a', 'completed', 'weird')] }).pending, ['a']);
check('observation file needs 12 digits', fo.findObservation(['turns/observations/2026101603_pr450_observation.md'], 450), []);
check('observation file needs the folder', fo.findObservation(['elsewhere/202610160316_pr450_observation.md'], 450), []);
check('observation number is not a regex', fo.findObservation(['turns/observations/202610160316_pr.*_observation.md'], '.*'), []);

// ── review threads ──────────────────────────────────────────────────
check('threads all resolved', fo.evaluateThreads([{ isResolved: true }, { isResolved: true }]), { ok: true, open: 0, total: 2 });
check('one open thread', fo.evaluateThreads([{ isResolved: true }, { isResolved: false }]), { ok: false, open: 1, total: 2 });
check('no threads', fo.evaluateThreads([]).ok, true);

// ── commits after the seal ──────────────────────────────────────────
const commit = (sha, date, authorLogin, files) => ({ sha, date, authorLogin, files });
const seal = '2026-10-16T03:45:00Z';
check('no seal record', fo.evaluatePostSeal({ sealAt: null, commits: [] }).ok, false);
check('nothing after seal', fo.evaluatePostSeal({ sealAt: seal, commits: [commit('aaaaaaa1', '2026-10-16T03:40:00Z', 'eaprime1', ['x.md'])] }).ok, true);
check('journey bot commit after seal is fine', fo.evaluatePostSeal({ sealAt: seal, commits: [commit('bbbbbbb1', '2026-10-16T03:46:00Z', 'github-actions[bot]', ['pr-journeys/a.md'])] }).ok, true);
check('human commit after seal', fo.evaluatePostSeal({ sealAt: seal, commits: [commit('ccccccc1', '2026-10-16T03:50:00Z', 'eaprime1', ['pr-journeys/a.md'])] }).late, ['ccccccc']);
check('bot commit touching other files', fo.evaluatePostSeal({ sealAt: seal, commits: [commit('ddddddd1', '2026-10-16T03:50:00Z', 'github-actions[bot]', ['pr-journeys/a.md', 'CLAUDE.md'])] }).late, ['ddddddd']);
check('bot commit with no files', fo.evaluatePostSeal({ sealAt: seal, commits: [commit('eeeeeee1', '2026-10-16T03:50:00Z', 'github-actions[bot]', [])] }).ok, false);

// ── observation file and content ────────────────────────────────────
const paths = ['turns/observations/202610160316_pr450_observation.md', 'turns/observations/202610160316_hodie_pr165_observation.md', 'turns/observations/202610070847_pr426_observation.md', 'turns/observations/README.md'];
check('finds the PR file', fo.findObservation(paths, 450), ['turns/observations/202610160316_pr450_observation.md']);
check('does not match another PR number', fo.findObservation(paths, 45), []);
check('hodie file is not custos PR 165', fo.findObservation(paths, 165), []);
check('no file', fo.findObservation(paths, 999), []);

const scores = [1, 2, 3, 4, 5, 6, 7, 8].map((n) => `| M${n} Something | ${n % 4} | count |`).join('\n');
const good = `status: complete\n\n## Seen\n\n## Carried forward\n\n## Scores\n\n| # | Score | Count |\n|---|---|---|\n${scores}\n\n## Result\nok\n`;
check('complete observation', fo.evaluateObservation(good).ok, true);
check('status open', fo.evaluateObservation(good.replace('status: complete', 'status: open')).problems, ['status is "open", not "complete"']);
check('no status line', fo.evaluateObservation(good.replace('status: complete\n', '')).problems, ['no "status:" line']);
check('missing section', fo.evaluateObservation(good.replace('## Carried forward', '## Elsewhere')).problems, ['missing section "## Carried forward"']);
check('missing score M3', fo.evaluateObservation(good.replace('| M3 Something | 3 | count |', '| M3 Something | n/a | count |')).problems, ['no score (0 to 3) for M3']);
check('score out of range', fo.evaluateObservation(good.replace('| M2 Something | 2 | count |', '| M2 Something | 7 | count |')).problems, ['no score (0 to 3) for M2']);
check('empty text', fo.evaluateObservation('').ok, false);

// ── watched paths ───────────────────────────────────────────────────
const files = ['atelier/x.md', 'moav/README.md', '.github/workflows/finalize-pr.yml', '.github/workflows/scan-lexeme.yml', '.github/scripts/cue-parser.js', 'vault/spade-of-aces/a.md'];
check('watched paths', fo.watchedPaths(files), ['moav/README.md', '.github/workflows/finalize-pr.yml', '.github/scripts/cue-parser.js', 'vault/spade-of-aces/a.md']);
check('named by file name', fo.unnamedWatched(['moav/README.md'], 'changed `README.md` in moav'), []);
check('named by folder', fo.unnamedWatched(['vault/spade-of-aces/a.md'], 'adds a file under vault/'), []);
check('not named', fo.unnamedWatched(['.github/scripts/cue-parser.js'], 'small docs change'), ['.github/scripts/cue-parser.js']);

// ── stale-claims line ───────────────────────────────────────────────
check('parse stale', fo.parseStale('  not in tree: a\nCLAUDE.md: 4 of 104 backticked path-like names not in the tree\nREADME.md: 0 of 5 x'), { flagged: 4, total: 104 });
check('parse stale, nothing', fo.parseStale('nothing here'), null);

// ── file review checklist (the Shepherd Considers comment) ──────────
const fmark = (box, path) => `- [${box}] [\`${path}\`](x) <!--fr ${encodeURIComponent(path)} abc-->`;
const checklist = (head, count, listed, lines) => ['<!-- custos-shepherd-considers -->', `<!--fr-head ${head} total=${count} shown=${listed}-->`, ...lines].join('\n');
const done = checklist('h1', 2, 2, [fmark('x', 'a.md'), fmark('x', 'b.md')]);
const journey = (sha) => ({ sha, authorLogin: 'github-actions[bot]', files: ['pr-journeys/j.md'] });
check('file review: all ticked', fo.evaluateFileReview({ body: done, head: 'h1' }).ok, true);
check('file review: no comment', fo.evaluateFileReview({ body: '', head: 'h1' }).problems, ['no Shepherd Considers comment']);
check('file review: plain list, no checklist', fo.evaluateFileReview({ body: '<!-- custos-shepherd-considers -->\n- a.md', head: 'h1' }).problems, ['the comment has no checklist']);
const half = checklist('h1', 2, 2, [fmark('x', 'a.md'), fmark(' ', 'b.md')]);
check('file review: one unticked', fo.evaluateFileReview({ body: half, head: 'h1' }).open, ['b.md']);
check('file review: one unticked, message', fo.evaluateFileReview({ body: half, head: 'h1' }).problems, ['1 file(s) not yet read']);
check('file review: cut-off list', fo.evaluateFileReview({ body: checklist('h1', 9, 7, [fmark('x', 'a.md')]), head: 'h1' }).problems, ['2 file(s) not listed']);
check('file review: journey commit after the marked head', fo.evaluateFileReview({ body: done, head: 'h2', commits: [{ sha: 'h1' }, journey('h2')] }).ok, true);
check('file review: human commit after the marked head', fo.evaluateFileReview({ body: done, head: 'h2', commits: [{ sha: 'h1' }, { sha: 'h2', authorLogin: 'eaprime1', files: ['a.md'] }] }).problems, ['files changed since the checklist was written']);
check('file review: marked head not in the PR', fo.evaluateFileReview({ body: done, head: 'h9', commits: [{ sha: 'h2' }] }).problems, ['the checklist describes another head']);
check('file review: head read from the comment', fo.checklistHead(done), 'h1');

// ── render and the hard-fail rule ───────────────────────────────────
const okAll = { checks: { ok: true, bad: [], pending: [] }, threads: { ok: true, open: 0, total: 3 }, post: { ok: true, sealed: true, late: [] }, obs: { ok: true, problems: [] }, obsPath: 'turns/observations/x_pr1_observation.md', fileReview: { ok: true, open: [], problems: [] } };
check('hard fail: all ok', fo.hardFail(okAll), false);
check('hard fail: pending check', fo.hardFail({ ...okAll, checks: { ok: false, bad: [], pending: ['x'] } }), true);
check('hard fail: file review not done', fo.hardFail({ ...okAll, fileReview: { ok: false, open: ['b.md'], problems: ['1 file(s) not yet read'] } }), true);
check('hard fail: file review missing', fo.hardFail({ ...okAll, fileReview: undefined }), true);
check('hard fail: no observation file', fo.hardFail({ ...okAll, obsPath: null }), true);
const text = fo.render({ head: 'abcdef1234567', ...okAll, watched: ['moav/README.md'], unnamed: [], stale: { flagged: 4, total: 104 } });
check('render has marker', text.startsWith(fo.MARK), true);
check('render names the head', text.includes('`abcdef1`'), true);
check('render says report only', text.includes('does not seal and does not merge'), true);
const textOpen = fo.render({ head: 'abcdef1234567', ...okAll, fileReview: { ok: false, open: ['b.md'], problems: ['1 file(s) not yet read'] }, watched: [], unnamed: [], stale: null });
check('render shows the file review row', text.includes('File review') && text.includes('every file to read is ticked'), true);
check('render lists unticked files', textOpen.includes('`b.md`') && textOpen.includes('not yet read'), true);
check('render shows stale line', text.includes('4 of 104'), true);

say(`${total - failed} of ${total} passed`);
process.exit(failed ? 1 : 0);
