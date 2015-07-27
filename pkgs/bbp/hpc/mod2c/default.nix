{ stdenv, fetchgitPrivate, cmake, bbp-cmake, pkgconfig, bison, flex, python }:

stdenv.mkDerivation rec {
  name = "mod2c-1.1.1-stable";
  buildInputs = [ stdenv cmake pkgconfig bison flex python];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/sim/mod2c";
    rev = "2d8cbf240ed6739de6c06a397238e028f61bf307";
    sha256 = "1i3xjyk1gq0vax07lkp48jhcx48dgf26q1yhjz5jh0vnbaarxvjz";
  };
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@include(CommonCPack)@include(PackageConfig)@g' CMakeLists.txt
	'';  
  
}


