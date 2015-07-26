{ stdenv, fetchgitPrivate, boost, libxml2, cmake, bbp-cmake, mpiRuntime, pkgconfig, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "hpctools-3.3.0-stable";
  buildInputs = [ stdenv pkgconfig boost cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/hpc/HPCTools";
    rev = "f6ab16612e33692ad057c5ea637a141c4a19378a";
    sha256 = "0wbh15mnl7y4dj8g7ln6abagg9mjhkpvhlvii22r0xvmv86fzy1h";    
  };
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
	'';     
  
  enableParallelBuilding = true;  
}

