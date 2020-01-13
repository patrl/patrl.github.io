let
  # Look here for information about how to generate `nixpkgs-version.json`.
  #  → https://nixos.wiki/wiki/FAQ/Pinning_Nixpkgs
  pinnedVersion = builtins.fromJSON (builtins.readFile ./.nixpkgs-version.json);
  pinnedPkgs = import (builtins.fetchGit {
    inherit (pinnedVersion) url rev;
    ref = "nixos-unstable";
  }) { config = {allowBroken = true;}; };
in

# This allows overriding pkgs by passing `--arg pkgs ...`
{ pkgs ? pinnedPkgs }:

with pkgs;

mkShell {
  buildInputs = [
    pkgs.haskell.compiler.ghc865
    pkgs.git
    pkgs.zlib
    pkgs.cabal-install
    pkgs.pkgconfig
    pkgs.which
    pkgs.nodejs
    pkgs.haskellPackages.brittany
  ];

  LD_LIBRARY_PATH="${pkgs.zlib}/lib";
  SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
  GIT_SSL_CAINFO = "/etc/ssl/certs/ca-certificates.crt";
  LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
}
