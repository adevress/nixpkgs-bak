{ stdenv, fetchgitPrivate, cmake, bbp-cmake, boost, pkgconfig, mpiRuntime}:

stdenv.mkDerivation rec {
  name = "reportinglib-2.4.1-stable";
  buildInputs = [ stdenv cmake boost pkgconfig  mpiRuntime];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/sim/reportinglib/bbp";
    rev = "6ffbdbfb58b50ee312e85d7d75defffaf33abea8";
    sha256 = "0lkbrzqlpsqipm3p7l288xq2z057hfml4jq6mxzcx7qvs63ib0qh";
  };
  
  
  ##
  ## create virtual defines.h, we do not need this
  ## this file generation should be removed, this kind of check should
  ## be done  with configure_file() 
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@include(CommonCPack)@include(PackageConfig)@g' CMakeLists.txt &&
    touch reportinglib/defines.h
	'';  
  
}


