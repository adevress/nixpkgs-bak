{ stdenv, fetchgitPrivate, perl, cmake, bbp-cmake, pkgconfig, mpiRuntime, mod2c}:

stdenv.mkDerivation rec {
  name = "coreneuron-0.6.0-stable";
  buildInputs = [ stdenv perl cmake pkgconfig mpiRuntime mod2c];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/sim/coreneuron";
    rev = "85e93ec5f5648521a6c53186baf94a43849dea7a";
    sha256 = "0kl1spf1f24qac0mxn57l075f9ifs03ia99byazyxzzprp3la0zx";
  };
  
  patchPhase= ''
    ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
    '';  
  
}



