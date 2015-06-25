{ stdenv, fetchgitPrivate, cmake, bbp-cmake, pkgconfig}:

stdenv.mkDerivation rec {
  name = "bbptestdata-2.0.0-DEV";
  buildInputs = [ stdenv cmake bbp-cmake pkgconfig ];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/common/TestData";
    rev = "39b75bf8895819cb1bff0a58935efc7862cbd7f7";
    sha256 = "1vwra9a4ahwcqc6blh9zspn0vc5j5bz9micsq269ays57f9b9fvf";
  };
  
  patchPhase = ''
    ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common && 
    sed -i 's@set(BBP_TESTDATA ''${PROJECT_SOURCE_DIR})@set(BBP_TESTDATA '$out'/share/bbptestdata/)@g' CMakeLists.txt
    '';  
  
  postInstall = ''
    cp -r ../circuitBuilding_1000neurons $out/share/bbptestdata/ && 
    cp -r ../ballAndStick $out/share/bbptestdata/ && 
    cp -r ../NESTSpikeData $out/share/bbptestdata/ && 
    cp -r ../neuronMeshTest $out/share/bbptestdata/
    '';
    
}




