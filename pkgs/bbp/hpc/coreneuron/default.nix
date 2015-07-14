{ stdenv, fetchgitPrivate, perl, cmake, bbp-cmake, pkgconfig, mpiRuntime, mod2c}:

stdenv.mkDerivation rec {
  name = "coreneuron-0.6.0-DEV";
  buildInputs = [ stdenv perl cmake pkgconfig mpiRuntime mod2c];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/sim/coreneuron";
    rev = "cd01b52a7e5dd518678575a2e5b4c08dd5b27167";
    sha256 = "0r5qcnp3xzb77q13vmslwjri84d0q3swrjd10zl7724sw97lzlmg";
  };
  
  patchPhase= ''
    ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
    '';  
  
}



