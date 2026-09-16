#!/usr/bin/env bash
# Usage: ./check.sh <level> <flag>
# Example: ./check.sh 0 'FLAG{abc123def456}'
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ $# -ne 2 ]; then echo "usage: $0 <level 0-12> <FLAG{...}>"; exit 2; fi
if [ "$(bash "$here/flag.sh" "$1")" = "$2" ]; then
  echo "✅  Level $1 solved! Now open the next folder: playground/level-$(printf '%02d' $(( $1 + 1 )))"
  mkdir -p "$here/.progress" && touch "$here/.progress/level-$1"
else
  echo "❌  Not the flag for level $1. Keep digging."
fi
