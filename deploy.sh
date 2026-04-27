#!/usr/bin/env bash

stashed=0
if ! git diff-index --quiet HEAD --; then
    git stash push -m "deploy.sh autosave"
    stashed=1
fi

git checkout org-publish
./build.sh
git fetch --all
git checkout -b master --track origin/master
cp -a public/. .
git add -A
git commit -m "Publish."
git push origin master
git checkout org-publish
git branch -D master

if [ "$stashed" -eq 1 ]; then
    git stash pop
fi
