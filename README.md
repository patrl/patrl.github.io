# Readme

<https://patrickdelliott.com>

Features:

-   personal bibliography generated from a `.bib` file.
-   support for citations
-   blog entries written in markdown

Dependencies:

-   git
-   cabal
-   [nix](https://nixos.org/nix/)
-   [npm](https://www.npmjs.com/)

To build the site, take the following steps (in the develop branch):

-   `npm install`
-   run `cabal configure` followed by `cabal build` to compile the site
    executable (make sure that nix integration is enabled via the
    `–-enable-nix` flag).
-   `cabal run site build` to build the site.
-   you can preview the site on a local server by running
    `cabal run site watch`

To deploy the site to the `master` branch, run `./deploy.sh`.
