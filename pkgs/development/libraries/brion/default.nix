{ stdenv, fetchgit, boost, cmake, bbp-cmake, servus, lunchbox, vmmlib, cppcheck, pkgconfig, hdf5, zlib, doxygen }:

stdenv.mkDerivation rec {
  name = "brion-1.6.0-stable";
  buildInputs = [ stdenv pkgconfig boost cmake servus lunchbox vmmlib hdf5 zlib doxygen cppcheck];

  src = fetchgit {
    url = "https://github.com/BlueBrain/Brion.git";
    
    rev = "b7a91eb9f1ecdbe1c05b8e7cfd66b7add32197a0";
    sha256 = "1l66h3gcq7j1yy1jdcjdh0g4nxpdy91nk7phi9b8mg4q2nlgayfq";
  };

  enableParallelBuilding = true;
  
# patch phase include common cmake and 
# disable functional tests  
# fix HDF5 detect issues
 
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	sed -i 's@add_subdirectory(tests)@@g' CMakeLists.txt &&
	echo 'set(HDF5_hdf5_cpp_LIBRARY	"WeDontCARE")' >> CMakeLists
  '';  
  
  
}


