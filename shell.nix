{ pkgs ? import <nixpkgs> {}, ghc ? pkgs.ghc }:

pkgs.haskell.lib.buildStackProject {
  name = "patrickdelliott.com";
  inherit ghc;
  buildInputs = with pkgs; [ zlib gmp git imagemagick ghostscript (texlive.combine {
        inherit (texlive)
         stmaryrd
         collection-basic
         collection-latex;
      })
];
  LANG = "en_US.UTF-8";
  TMPDIR = "/tmp";
}
