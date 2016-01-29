{ stdenv, fetchgitPrivate, pkgconfig, boost, hpctools, libxml2, cmake, bbp-cmake, mpiRuntime, python, zlib, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "touchdetector-4.1.0-stable";
  buildInputs = [ stdenv pkgconfig boost hpctools zlib cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/building/TouchDetector";
    rev = "fd991efff636e6b451942d0aad8becc4557c0c55";
    sha256 = "1az1f2f252bdy61dbpbvd2kr55kfndv1wqfdi44vhcid6r2vp3yl";
  };

  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@set(Boost_USE_STATIC_LIBS ON)@set(Boost_USE_STATIC_LIBS OFF)@g' CMakeLists.txt	
	'';   
	
  cmakeFlags="-DBoost_USE_STATIC_LIBS=FALSE";  	

  enableParallelBuilding = true;
}


