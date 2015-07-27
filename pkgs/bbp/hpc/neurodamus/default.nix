{ stdenv
, fetchgitPrivate
, cmake
, bbp-cmake
, pkgconfig
, hdf5
, mpiRuntime
, zlib
, ncurses
, bluron
, reportinglib}:

stdenv.mkDerivation rec {
  name = "neurodamus-1.8.1-stable";
  buildInputs = [ stdenv cmake pkgconfig hdf5 ncurses zlib mpiRuntime bluron reportinglib];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/sim/neurodamus/bbp";
    rev = "7b322faf75f31a84f332b48782ab3418b59b29d2";
    sha256 = "08i81msnpbxkqp4nf2yv555ybrx44hcvbm0nvgwwxc5rai8xqr00";
  };
  
##
## downgrade required version : bug in 2015R2 release, 2.5 do not exist
## create defines.h file, need to be generated properly through configure_file()
  patchPhase= ''
ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common;
sed -i 's@include(CommonCPack)@include(PackageConfig)@g' CMakeLists.txt;
sed -i 's@ReportingLib 2.5@ReportingLib 2.4@g' CMake/FindPackages.cmake;
touch neurodamus/defines.h
    '';  
  
    cmakeFlags="-DBluron_PREFIX_DIR=${bluron}";
}


