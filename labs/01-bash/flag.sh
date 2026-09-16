#!/usr/bin/env bash
# Internal helper: prints the flag for a level. Flags are derived from a random
# per-workspace secret, so they are different for every learner and are not
# stored anywhere in plain text.
set -e
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ -f "$here/.secret" ] || head -c 32 /dev/urandom | base64 > "$here/.secret"
lvl="$1"
printf 'FLAG{%s}' "$(printf '%s:%s' "$(cat "$here/.secret")" "$lvl" | sha256sum | cut -c1-12)"
