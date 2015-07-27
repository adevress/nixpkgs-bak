{ stdenv, fetchgitPrivate, cmake, bbp-cmake, pkgconfig, hdf5, mpiRuntime, bluron}:

stdenv.mkDerivation rec {
  name = "neurodamus-1.8.1-stable";
  buildInputs = [ stdenv cmake pkgconfig hdf5 mpiRuntime bluron];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/sim/neurodamus/bbp";
    rev = "7b322faf75f31a84f332b48782ab3418b59b29d2";
    sha256 = "08i81msnpbxkqp4nf2yv555ybrx44hcvbm0nvgwwxc5rai8xqr00";
  };
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@include(CommonCPack)@include(PackageConfig)@g' CMakeLists.txt
	'';  
  
}


