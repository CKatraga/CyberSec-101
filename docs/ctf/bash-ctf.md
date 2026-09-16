# Bash CTF — 13 levels

A Capture-The-Flag game that lives inside this repo and teaches you Bash by making you use it. Every level hides a `FLAG{............}`; find it, submit it, unlock the next.

!!! note "Flags are unique to you"
    Flags are generated from a random secret created in *your* workspace, so they're different for every learner and can't be googled. No cheating yourself. 🙂

## How to play

```bash
cd labs/01-bash
./setup.sh                        # builds the playground (auto-done in Codespaces)
cat playground/level-00/README    # read level 0
# ...solve it, find the FLAG{...}, then:
./check.sh 0 'FLAG{...}'          # submit
```

`check.sh` tells you if you're right and which folder to open next. Your solved levels are recorded in `labs/01-bash/.progress/`.

## What each level teaches

| Level | Skill you'll learn |
|---|---|
| 0 | Reading files (`cat`) and how the game works |
| 1 | Hidden files (`ls -a`) |
| 2 | Awkward filenames (quoting, `cat ./-`) |
| 3 | Finding text among junk (`file`, `grep -r`) |
| 4 | Finding files by size (`find -size`) |
| 5 | Searching logs (`grep`, `grep -o`) |
| 6 | Decoding Base64 (`base64 -d`) |
| 7 | ROT13 / Caesar cipher (`tr`) |
| 8 | Permissions (`ls -l`, `chmod`) |
| 9 | Deduplication (`sort`, `uniq -u`) |
| 10 | Nested archives (`file`, `tar`, `gzip`, `bzip2`) |
| 11 | Strings in binaries (`strings`) |
| 12 | Talking to a web service (`curl -H`, `nc`) |

## Rules

- **No reading `setup.sh`** — that's the answer key.
- Stuck 20 minutes? Note what you tried in your [journal](../journal.md), then ask Pranith.
- Each `README` gives exactly one hint. Read it carefully — the hint names the command you need.

!!! tip "Reset"
    Re-run `./setup.sh` to rebuild everything with fresh flags (useful if you want to replay for speed).
