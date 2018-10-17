#!/usr/bin/env bash

dirhash=$(ipfs add -r _site/ | grep _site$ | cut -d" " -f2)

git stash
git checkout develop
cabal run site clean
cabal run site build
ipfs name publish $dirhash
git fetch --all
git checkout -b master --track origin/master
cp -a _site/. .
git add -A
git commit -m \"Publish.\"
git push origin master:master
git checkout develop
git branch -D master
git stash pop
