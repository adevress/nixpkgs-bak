{ stdenv, fetchgitPrivate, boost, libxml2, cmake, bbp-cmake, mpiRuntime, pkgconfig, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "hpctools-3.3.0-DEV";
  buildInputs = [ stdenv pkgconfig boost cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/hpc/HPCTools";
    rev = "a5cec29a4e0d5a8e3121046068dec8380defb2be";
    sha256 = "1hh2pn86rkzsq70aqsv0sgcm5vi7z0inzqmdhj0lrh39igjwlv3p";    
  };
  
	patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
	'';     
  
  enableParallelBuilding = true;  
}

