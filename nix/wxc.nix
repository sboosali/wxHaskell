{ mkDerivation, base, bytestring, Cabal, directory, filepath
, libX11, mesa, process, split, stdenv, wxdirect, wxGTK
}:
mkDerivation {
  pname = "wxc";
  version = "0.93.0.0";
  src = ./wxc;
  setupHaskellDepends = [
    base bytestring Cabal directory filepath process split
  ];
  libraryHaskellDepends = [ base split wxdirect ];
  librarySystemDepends = [ libX11 mesa ];
  libraryPkgconfigDepends = [ wxGTK ];
  postInstall = "cp -v dist/build/libwxc.so.0.93.0.0 $out/lib/libwxc.so";
  postPatch = "sed -i -e '/ldconfig inst_lib_dir/d' Setup.hs";
  homepage = "https://wiki.haskell.org/WxHaskell";
  description = "wxHaskell C++ wrapper";
  license = "unknown";
}
