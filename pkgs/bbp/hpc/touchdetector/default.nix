{ stdenv, fetchgitPrivate, pkgconfig, boost, hpctools, libxml2, cmake, bbp-cmake, mpiRuntime, python, zlib, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "touchdetector-4.1.0-stable";
  buildInputs = [ stdenv pkgconfig boost hpctools zlib cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/building/TouchDetector";
    rev = "2def97db9dd159b2a414e615c92900304c298a17";
    sha256 = "17yjwlm5n2sj20p3r1vhjr6d68r9h135pwkrvm57xklcsi0r5g6y";
  };

  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@set(Boost_USE_STATIC_LIBS ON)@set(Boost_USE_STATIC_LIBS OFF)@g' CMakeLists.txt	
	'';   
	
  cmakeFlags="-DBoost_USE_STATIC_LIBS=FALSE";  	

  enableParallelBuilding = true;
}


