{ stdenv, fetchgitPrivate, boost, libxml2, cmake, bbp-cmake, mpiRuntime, pkgconfig, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "hpctools-3.3.0-DEV";
  buildInputs = [ stdenv pkgconfig boost cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/hpc/HPCTools";
    rev = "b04ba8004e734a94ff9a73fd479e95f7876e336a";
    sha256 = "1sy9m1fjmf25wsxxp89dpi2cxp6zpps3sq09fx2hi4ili3yv0w2i";    
  };
  
	patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
	'';     
  
  enableParallelBuilding = true;  
}

