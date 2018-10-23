{ mkDerivation, base, clay, containers, hakyll, hakyll-sass, mtl
, pandoc, pandoc-types, process, stdenv
}:
mkDerivation {
  pname = "patrickdelliott";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base clay containers hakyll hakyll-sass mtl pandoc pandoc-types
    process
  ];
  license = stdenv.lib.licenses.unfree;
  hydraPlatforms = stdenv.lib.platforms.none;
}
