// Shared pieces for the observation log tests: a pass/fail counter and a printer.
// Run: bash tools/test_observation_log.sh

const say = (text) => process.stdout.write(`${text}\n`);

// A counter that prints each failure. report() prints the total and returns the exit code.
function makeChecker(label) {
  const tally = { failed: 0, count: 0 };
  const check = (name, ok, detail) => {
    tally.count += 1;
    if (ok) return;
    tally.failed += 1;
    say(`FAIL  ${name}${detail ? `  ${detail}` : ''}`);
  };
  const eq = (name, got, want) =>
    check(name, JSON.stringify(got) === JSON.stringify(want),
      `got ${JSON.stringify(got)}, want ${JSON.stringify(want)}`);
  const report = () => {
    say(`${tally.count - tally.failed} of ${tally.count} ${label} passed`);
    return tally.failed ? 1 : 0;
  };
  return { check, eq, report };
}

module.exports = { say, makeChecker };
