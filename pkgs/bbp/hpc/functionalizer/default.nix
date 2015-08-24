{ stdenv, fetchgitPrivate, pkgconfig, boost, hpctools, libxml2, cmake, mpiRuntime, zlib, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "functionalizer-3.6.0-DEV";
  buildInputs = [ stdenv pkgconfig boost hpctools zlib cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/building/Functionalizer";
    rev = "5f325db8bf2f1c8321d87e1657a09db748c6bd69";
    sha256 = "04mvd6648dv45ifcw7dff5pk6wl2j92z9mn0w04ylcw96pgj6flw";
    fetchSubmodules = false;
  };
  
  cmakeFlags="-DBoost_USE_STATIC_LIBS=FALSE";   

  enableParallelBuilding = true;
}


