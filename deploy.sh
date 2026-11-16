#!/usr/bin/env bash
# Build the site, publish public/ to the master branch (served by GitHub Pages)
# and mirror public-gemini/ to the Gemini capsule on nebula (served by agate).
# Uses a temporary worktree, so the current checkout is never touched.
set -euo pipefail
cd "$(dirname "$0")"

./build.sh

# Dotfiles are excluded, which also protects them from --delete: agate keeps
# its TLS certificates in /home/gemini/.certificates.
rsync -av --delete --exclude '.*' --chmod=D755,F644 \
    public-gemini/ nebula:/home/gemini/

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
