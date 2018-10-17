#!/usr/bin/env bash

dirhash=$(ipfs add -r _site/ | grep _site$ | cut -d" " -f2)

ipfs name publish $dirhash
