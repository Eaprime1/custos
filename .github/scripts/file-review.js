// File review checklist: the rules behind the list in The Shepherd Considers
// (.github/workflows/sovran-voice.yml).
//
// Nothing here calls GitHub. The workflow hands over the changed files and the
// previous comment, and gets back the checklist text. Two kinds of file:
//   Read these      unchecked until the Shepherd ticks the box. A tick belongs to one
//                   version of the file; when the file changes the tick clears.
//   Not for reading ticked by the rules in .github/review-skip.json, with a reason.
// A file on the watched list is never skipped.
//
// The tick lives in the comment line: `- [x] ... <!--fr <encoded path> <blob sha>-->`.
// This module only reads and writes text. It never seals or merges.

const CONFIG = require('../review-skip.json');

const MARK = '<!-- custos-shepherd-considers -->';

function matches(path, rule) {
  if (rule.exact !== undefined) return path === rule.exact;
  if (rule.prefix !== undefined) return path.startsWith(rule.prefix);
  return rule.suffix !== undefined && path.endsWith(rule.suffix);
}

function isWatched(path, config = CONFIG) {
  return config.watched.some((rule) => matches(path, rule));
}

// The reason a file needs no reading, or null when it does.
function skipReason(path, config = CONFIG) {
  if (isWatched(path, config)) return null;
  const rule = config.rules.find((r) => matches(path, r));
  return rule ? rule.reason : null;
}

const LINE_RE = /^- \[([ xX])\] .*<!--fr (\S+) (\S+)-->\s*$/;

// Earlier ticks: path -> { checked, sha }, read from the previous comment.
function readMarks(body) {
  const marks = new Map();
  String(body || '').split('\n').forEach((line) => {
    const m = line.match(LINE_RE);
    if (m) marks.set(decodeURIComponent(m[2]), { checked: m[1] !== ' ', sha: m[3] });
  });
  return marks;
}

// One file -> { path, sha, checked, skipped, note }.
function judge(file, marks, config = CONFIG) {
  const path = file.filename;
  const base = { path, sha: file.sha, checked: false, skipped: false, note: '' };
  const reason = skipReason(path, config);
  if (reason) return { ...base, checked: true, skipped: true, note: reason };
  const before = marks.get(path);
  if (!before?.checked) return base;
  if (before.sha === file.sha) return { ...base, checked: true };
  return { ...base, note: 'changed since you ticked it' };
}

function renderLine(entry, link) {
  const box = entry.checked ? 'x' : ' ';
  const note = entry.note ? ` · *${entry.note}*` : '';
  const mark = `<!--fr ${encodeURIComponent(entry.path)} ${entry.sha}-->`;
  return `- [${box}] ${link}${note} ${mark}`;
}

// files: [{ filename, sha }], marks: from readMarks, linkFor: file -> markdown link text.
// Returns the two lists of lines and how many files wait for reading.
function build({ files, marks, linkFor, config = CONFIG }) {
  const entries = files.map((f) => ({ ...judge(f, marks, config), file: f }));
  const line = (e) => renderLine(e, linkFor(e.file));
  const toRead = entries.filter((e) => !e.skipped);
  return {
    read: toRead.map(line),
    skipped: entries.filter((e) => e.skipped).map(line),
    toRead: toRead.length,
    done: toRead.filter((e) => e.checked).length,
  };
}

// What a gate can learn from the comment: the head it describes and the unticked files.
function parseState(body) {
  const text = String(body || '');
  const head = (text.match(/<!--fr-head (\S+) total=(\d+) shown=(\d+)-->/) || []);
  const open = [];
  text.split('\n').forEach((line) => {
    const m = line.match(LINE_RE);
    if (m && m[1] === ' ') open.push(decodeURIComponent(m[2]));
  });
  return { head: head[1] || null, total: Number(head[2]) || 0, shown: Number(head[3]) || 0, open };
}

module.exports = { MARK, skipReason, isWatched, readMarks, judge, renderLine, build, parseState };
