#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf '%s\n' \
    "Usage:" \
    "  bash eng/check-workbench-staging.sh" \
    "  bash eng/check-workbench-staging.sh --tree <commit>" \
    "  bash eng/check-workbench-staging.sh --range <base> <head>"
}

root="$(git rev-parse --show-toplevel)"
cd "$root"

mode="${1:---cached}"
case "$mode" in
  --cached)
    violations="$(git diff --cached --name-status --diff-filter=ACMRTUXB -- repos/)"
    evidence="staged workbench changes"
    ;;
  --tree)
    test "$#" -eq 2 || { usage >&2; exit 2; }
    violations="$(git ls-tree -r --name-only "$2" -- repos/)"
    evidence="tree $2"
    ;;
  --range)
    test "$#" -eq 3 || { usage >&2; exit 2; }
    violations="$(git diff --name-status --diff-filter=ACMRTUXB "$2...$3" -- repos/)"
    evidence="range $2...$3"
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac

if test -n "$violations"; then
  printf 'ERROR: %s contains forbidden repos/ paths:\n%s\n' "$evidence" "$violations" >&2
  printf '%s\n' \
    "Target repositories are local workspace inputs, never workbench contribution content." \
    "Unstage them with: git restore --staged -- repos/" >&2
  exit 1
fi

printf 'PASS: %s contains no workbench contribution content under repos/.\n' "$evidence"
