#!/run/current-system/sw/bin/env nix-shell
#!nix-shell -i bash -p git stack nix-shell 

git stash && git checkout develop && stack exec site clean && stack exec site build && git fetch --all && git checkout -b master --track origin/master && cp -a _site/. . && git add -A && git commit -m \"Publish.\" && git push origin master:master && git checkout develop && git branch -D master && git stash pop
