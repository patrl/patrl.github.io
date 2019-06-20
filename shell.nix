{
  pkgs ? import <nixpkgs> {},
  hc ? "ghc865"
}:

pkgs.stdenv.mkDerivation rec {
  name = "example";
  buildInputs = [
    pkgs.haskell.compiler.${hc}
    pkgs.git
    pkgs.zlib
    pkgs.cabal-install
    pkgs.pkgconfig
    pkgs.which
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH
    export LANG=en_US.UTF-8
  '';
  LOCALE_ARCHIVE =
    if pkgs.stdenv.isLinux
    then "${pkgs.glibcLocales}/lib/locale/locale-archive"
    else "";
}
