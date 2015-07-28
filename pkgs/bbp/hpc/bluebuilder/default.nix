{ stdenv, 
fetchgitPrivate, 
pkgconfig, 
boost, 
hpctools, 
libxml2, 
hdf5,
zlib,
cmake, 
bbp-cmake, 
mpiRuntime, 
}:

stdenv.mkDerivation rec {
  name = "bluebuilder-1.2.1-stable";
  buildInputs = [ stdenv pkgconfig boost hpctools hdf5 zlib cmake mpiRuntime libxml2];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/building/BlueBuilder";
    rev = "7df9cc97e1f4d9734a902b8389c8016fbd320253";
    sha256 = "19bfriagiwzrqh6q0mrf4vjx2k6qdj7ai7vi3nkw0irpngcmlwwr";
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


