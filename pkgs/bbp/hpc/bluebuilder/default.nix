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
  name = "bluebuilder-1.2.1-DEV";
  buildInputs = [ stdenv pkgconfig boost hpctools hdf5 zlib cmake mpiRuntime libxml2];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/building/BlueBuilder";
    rev = "731bf5694aba9cb433273beb9009c5fbe50ee3fa";
    sha256 = "0j8qb017p61gm0l4d7y4jjmm69m3q5acyym7z2m75ws1szg1yiq6";
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


