{ stdenv, fetchgitPrivate, pkgconfig, boost, hpctools, libxml2, cmake, bbp-cmake, mpiRuntime, zlib, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "functionalizer-3.6.0-stable";
  buildInputs = [ stdenv pkgconfig boost hpctools zlib cmake mpiRuntime libxml2 python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/building/Functionalizer";
    rev = "c3b07faeda873320384482f2d40c177149be714c";
    sha256 = "0phh2819yp7qvfaqwpxkdyf6d034mpnajkjs6bsww4gm5rlifr9w";
  };
  
  cmakeFlags="-DBoost_USE_STATIC_LIBS=FALSE";  
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@include(CommonCPack)@@g' CMakeLists.txt &&
	sed -i 's@include(CPackConfig)@@g' CMakeLists.txt &&
	sed -i 's@set(Boost_USE_STATIC_LIBS ON)@set(Boost_USE_STATIC_LIBS OFF)@g' CMakeLists.txt
	'';    

  enableParallelBuilding = true;
}


