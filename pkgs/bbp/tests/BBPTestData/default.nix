{ stdenv, fetchgitPrivate, cmake, bbp-cmake, pkgconfig}:

stdenv.mkDerivation rec {
  name = "bbptestdata-2.0.0-DEV";
  buildInputs = [ stdenv cmake bbp-cmake pkgconfig ];


  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/common/TestData";
    rev = "b81b4f83bbaa8cc91e620d9a35d3c5ff8bf9017f";
    sha256 = "1n6ylg2dcsadkgmr02xdn6mcrfmwbpanags2pqwj7hlj5afgjgmg";
  };
  
  patchPhase = ''
    ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common && 
    sed -i 's@set(BBP_TESTDATA ''${PROJECT_SOURCE_DIR})@set(BBP_TESTDATA '$out'/share/bbptestdata/)@g' CMakeLists.txt
    '';  
  
  postInstall = ''
    mkdir -p $out/share/bbptestdata/ &&
    cp -r ../circuitBuilding_1000neurons $out/share/bbptestdata/ && 
    cp -r ../ballAndStick $out/share/bbptestdata/ && 
    cp -r ../NESTSpikeData $out/share/bbptestdata/ && 
    cp -r ../neuronMeshTest $out/share/bbptestdata/
    '';
    
}




