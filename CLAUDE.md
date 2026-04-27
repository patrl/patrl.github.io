# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal academic website (patrickdelliott.com) built with Emacs `org-publish`. Content authored in Org-mode files under `content/`, exported to static HTML in `public/`. Deployment uses a two-branch scheme: `org-publish` (source) and `master` (built site, served via GitHub Pages).

## Commands

- `./build.sh` — runs `emacs -Q --script build-site.el`, which installs `htmlize` into `./.packages/` (first run only) and exports the site to `./public/`.
- `./deploy.sh` — stashes WIP, builds on `org-publish`, copies `public/` onto a fresh `master` branch tracked from `origin/master`, commits as `"Publish."`, pushes, then returns to `org-publish` and deletes the local `master`. Pushes to remote — confirm with the user before running.

`public/` and `.packages/` are gitignored on the `org-publish` branch; built artifacts only live on `master`.

## Architecture

`build-site.el` defines two `org-publish` projects:

1. **`patrickdelliott.com`** — recursively publishes `.org` files under `content/` to HTML. Key settings: HTML5 with `nav`/`main`/`footer` div containers, no default styles or scripts, headline level 2, auto-generated `sitemap.org`. Page chrome is injected from `content/html/head.html` and `content/html/preamble.html` via `org-html-head` / `org-html-preamble`; postamble is disabled.
2. **`images`** — copies static assets (css, js, images, pdfs, fonts) from `content/` to `public/` via `org-publish-attachment`.

`org-publish-all` is called with the force flag (`t`), so every build is a full rebuild.

## Content layout

- `content/index.org`, `content/teaching.org`, `content/resources.org` — top-level pages.
- `content/research/` — `papers.org`, `slides-handouts.org`.
- `content/pdf/`, `content/files/`, `content/images/` — static assets copied verbatim.
- `content/css/patrickdelliott.css` — single stylesheet, linked from `head.html`.
- `content/sitemap.org` — generated, do not edit by hand.

When adding a new page, drop a new `.org` file under `content/` (or a subdirectory) and link to it from an existing page; the publish step picks it up automatically.
