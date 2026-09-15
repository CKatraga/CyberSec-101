#!/usr/bin/env bash
# Runs once when the Codespace is created.
set -e
cd "$(dirname "$0")/.."
echo "==> Generating Bash CTF playground"
bash labs/01-bash/setup.sh
echo
echo "==> Workspace ready."
echo "    Preview the course site:   mkdocs serve -a 0.0.0.0:8000"
echo "    Start the Bash CTF:        cd labs/01-bash && cat README.md"
