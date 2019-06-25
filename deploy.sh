#!/usr/bin/env bash

git stash
git checkout develop
cabal new-run site clean
cabal new-run site build
git fetch --all
git checkout -b master --track origin/master
cp -a _site/. .
git add -A
git commit -m \"Publish.\"
git push origin master:master
git checkout develop
git branch -D master
git stash pop
