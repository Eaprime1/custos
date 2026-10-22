// Probatio requests do not prove that review or a soft seal happened.
// The ready-for-oversight label is applied only after a verified packet is prepared.
// A human push invalidates that packet and removes the label.

const { parseComment } = require('./cue-parser.js');

const LABEL = 'ready-for-oversight';
const MARK = '<!-- custos-probatio -->';

// Return the addressed Probatio requests. These are requests only; they never set a label.
function probatioRequests(body, authorType, association) {
  const read = parseComment(body, { authorType, association });
  return read.cues.filter((cue) =>
    cue.sigil === '^' && cue.action === 'Probatio' && !cue.modifiers.includes('Ultima'));
}

function movedComment(head) {
  return `${MARK}\n**Probatio packet invalidated**: the head moved to \`${head}\`. ` +
    `Label \`${LABEL}\` removed. Recheck contributor reports and prepare a new packet.\n`;
}

async function upsert({ github, repo, number, body }) {
  const all = await github.paginate(github.rest.issues.listComments, { ...repo, issue_number: number, per_page: 100 });
  const mine = all.find((c) => c.user.type === 'Bot' && (c.body || '').startsWith(MARK));
  if (mine) await github.rest.issues.updateComment({ ...repo, comment_id: mine.id, body });
  else await github.rest.issues.createComment({ ...repo, issue_number: number, body });
}

// A request cue is intentionally not a readiness transition. The requesting contributor(s)
// prepare their reviews; ChatGPT verifies them and prepares the oversight packet.
async function onComment({ github, context, core }) {
  const c = context.payload.comment;
  const requests = probatioRequests(c.body, c.user.type, c.author_association);
  if (!requests.length) { core.info('No Probatio request cue.'); return; }
  core.info('Probatio request recognized. Readiness label waits for packet verification.');
}

// On a push by a person, a packet covered an earlier head, so take the label off.
async function onPush({ github, context, core }) {
  const pr = context.payload.pull_request;
  if (context.payload.sender.type === 'Bot') { core.info('Bot push; the label stays.'); return; }
  if (!pr.labels.some((label) => label.name === LABEL)) { core.info('No verified packet label to withdraw.'); return; }
  const repo = context.repo;
  await github.rest.issues.removeLabel({ ...repo, issue_number: pr.number, name: LABEL });
  await upsert({ github, repo, number: pr.number, body: movedComment(pr.head.sha.slice(0, 7)) });
}

module.exports = { LABEL, MARK, probatioRequests, onComment, onPush };
