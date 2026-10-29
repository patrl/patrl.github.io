#!/usr/bin/env bash
# Build the site and publish public/ to the master branch (served by GitHub Pages).
# Uses a temporary worktree, so the current checkout is never touched.
set -euo pipefail
cd "$(dirname "$0")"

./build.sh

tmp=$(mktemp -d)
git fetch origin master
git worktree add --detach "$tmp" origin/master
trap 'git worktree remove --force "$tmp"' EXIT

rsync -a --delete --exclude .git public/ "$tmp"/
cd "$tmp"
git add -A
if git diff --cached --quiet; then
    echo "Nothing to deploy."
    exit 0
fi
git commit -m "Publish."
git push origin HEAD:master
