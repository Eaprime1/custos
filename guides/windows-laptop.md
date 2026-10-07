# Windows Laptop — Known Quirks

`prima-clock: 202610061958` · `suit: ♣️ Club — working notes`

Things that went wrong when running custos from VS Code on the Windows laptop, and the fix for
each. Any conversation that hits one of these can start here. Add a row when a new one turns
up; leave old rows in place, because a setting that was fixed can switch back on after a
Windows update.

| Symptom | Cause | Fix | Found |
| --- | --- | --- | --- |
| `bash tools/*.sh` fails with `$'\r': command not found` | `core.autocrlf=true` checked the scripts out with Windows line endings | `.gitattributes` keeps scripts LF (PR #422). On an older checkout: `git add --renormalize . && git checkout -- .` | 202609302342 |
| `Python was not found; run without arguments to install from the Microsoft Store` from `validate_json_yaml.sh` or any `python3` call in Git Bash | Windows **App execution aliases** put Store stubs named `python.exe` / `python3.exe` ahead of the real Python on `PATH` | Settings → Apps → Advanced app settings → App execution aliases → turn off **python.exe** and **python3.exe**. The validator now detects this and prints the fix | 202610061928 |
| `python3: command not found` after turning the aliases off | The python.org installer ships `python.exe` only, no `python3.exe` | `validate_json_yaml.sh` falls back to `python` when it is Python 3. YAML checks also need PyYAML: `python -m pip install pyyaml` | 202610061958 |
| CI `validate` fails on `.vscode/*.json` | VS Code accepts comments in JSON, but `validate_json_yaml.sh` (CI) checks strict JSON | Keep `.vscode/*.json` free of `//` comments; explain settings here or in a task's `detail` field | 202610061958 |
| A VS Code task picks the wrong `bash` | `bash.exe` in `C:\Windows\System32` is WSL, not Git Bash | `.vscode/tasks.json` names `C:\Program Files\Git\bin\bash.exe` directly | 202610061928 |

## Quick check

From a Git Bash terminal at the repo root:

```bash
python3 -c 'import sys; print(sys.version)'    # a version, not the Store message
git ls-files --eol tools/*.sh | grep -v i/lf    # no output
bash tools/validate_json_yaml.sh >/dev/null && echo validator ok
```

## Where this machine lives

- The repo path is `C:\Users\eapri\mulberry\custos`.
- `.locations/` does not have an entry for this laptop yet. The `mulberry` entry there points at
  an Ubuntu path. Per-machine place configs are packet P2.5 of
  `atelier/act-ii/PLAN-act-ii-setup-202610012134.md`.
