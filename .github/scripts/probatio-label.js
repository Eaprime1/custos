// Soft seal: the owner's `^<name> probatio` marks a PR ready for oversight.
// Plan: docs/latin-workflow-v2.md. The label is a signal. It never seals or merges.
// The seal stays in finalize-pr.yml, on `ultima probatio`.

const { parseComment } = require('./cue-parser.js');

const LABEL = 'ready-for-oversight';
const MARK = '<!-- custos-probatio -->';

// A soft-seal cue is a caret cue whose action is Probatio, without the Ultima modifier.
function isSoftProbatio(cue) {
  return cue.sigil === '^' && cue.action === 'Probatio' && !cue.modifiers.includes('Ultima');
}

// Returns the cues that set the label, or an empty list. The parser skips bots,
// non-owners, footer comments and quoted or code text.
function softSeals(body, authorType, association) {
  const read = parseComment(body, { authorType, association });
  return read.cues.filter(isSoftProbatio);
}

function sealComment(head, who) {
  return `${MARK}\n**Probatio (soft)** for \`${head}\`, addressed to ${who}. ` +
    `Label \`${LABEL}\` set: this PR is ready for the oversight review.\n`;
}

function movedComment(head) {
  return `${MARK}\n**Probatio (soft)** withdrawn: the head moved to \`${head}\`. ` +
    `Label \`${LABEL}\` removed. Give \`probatio\` again when the work is ready.\n`;
}

async function upsert({ github, repo, number, body }) {
  const all = await github.paginate(github.rest.issues.listComments, { ...repo, issue_number: number, per_page: 100 });
  const mine = all.find((c) => c.user.type === 'Bot' && (c.body || '').startsWith(MARK));
  if (mine) await github.rest.issues.updateComment({ ...repo, comment_id: mine.id, body });
  else await github.rest.issues.createComment({ ...repo, issue_number: number, body });
}

async function ensureLabel({ github, repo }) {
  try {
    await github.rest.issues.getLabel({ ...repo, name: LABEL });
  } catch (e) {
    if (e.status !== 404) throw e;
    await github.rest.issues.createLabel({ ...repo, name: LABEL, color: '0e8a16',
      description: 'Soft seal given: ready for the oversight review' });
  }
}

// On a comment: set the label when a soft-seal cue is present.
async function onComment({ github, context, core }) {
  const c = context.payload.comment;
  const seals = softSeals(c.body, c.user.type, c.author_association);
  if (!seals.length) { core.info('No soft seal in this comment.'); return; }
  const repo = context.repo;
  const number = context.payload.issue.number;
  const { data: pr } = await github.rest.pulls.get({ ...repo, pull_number: number });
  await ensureLabel({ github, repo });
  await github.rest.issues.addLabels({ ...repo, issue_number: number, labels: [LABEL] });
  const who = [...new Set(seals.map((s) => `^${s.navigo}`))].join(', ');
  await upsert({ github, repo, number, body: sealComment(pr.head.sha.slice(0, 7), who) });
}

// On a push by a person: the seal covered an earlier head, so take the label off.
async function onPush({ github, context, core }) {
  const pr = context.payload.pull_request;
  if (context.payload.sender.type === 'Bot') { core.info('Bot push; the label stays.'); return; }
  if (!pr.labels.some((l) => l.name === LABEL)) { core.info('No soft seal to withdraw.'); return; }
  const repo = context.repo;
  await github.rest.issues.removeLabel({ ...repo, issue_number: pr.number, name: LABEL });
  await upsert({ github, repo, number: pr.number, body: movedComment(pr.head.sha.slice(0, 7)) });
}

module.exports = { LABEL, MARK, isSoftProbatio, softSeals, onComment, onPush };
