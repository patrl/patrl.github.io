#!/usr/bin/env bash

git stash
git checkout org-publish 
./build.sh
git fetch --all
git checkout -b master --track origin/master
cp -a public/. .
git add -A
git commit -m \"Publish.\"
git push origin master:master
git checkout org-publish 
git branch -D master
git stash pop
