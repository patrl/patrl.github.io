#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"

rm -rf public public-gemini
emacs -Q --script build-site.el
