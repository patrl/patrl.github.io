#!/usr/bin/env sh

git stash && git checkout develop && cabal run site clean && cabal run site build && find ~/dat/patrickdelliott.com/ -mindepth 1 -maxdepth 1 \! \( -name .dat -o -name dat.json \) -exec rm -rf '{}' \; && cp -a _site/. ~/dat/patrickdelliott.com/. && git stash pop && cd ~/dat/patrickdelliott.com && dat share --watch false
