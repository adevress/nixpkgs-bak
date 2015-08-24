{ stdenv, fetchgitPrivate, boost, libxml2, cmake, bbp-cmake, mpiRuntime, pkgconfig, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "hpctools-3.3.0-DEV";
  buildInputs = [ stdenv pkgconfig boost cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/hpc/HPCTools";
    rev = "69eaff60e664a58fcce57bd673fbb2da267b18f9";
    sha256 = "1m09ldgzvgw55r3cskcklanf7xl0il6hhzncars5gcly7bnl625r";    
  };
  
	patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
	'';     
  
  enableParallelBuilding = true;  
}

