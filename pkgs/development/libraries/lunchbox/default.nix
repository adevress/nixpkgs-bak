{ stdenv, boost, fetchgit, cmake, bbp-cmake, mpich2, servus, pkgconfig, leveldb, doxygen }:

stdenv.mkDerivation rec {
  name = "lunchbox-1.11.1-stable";
  buildInputs = [ stdenv boost pkgconfig bbp-cmake servus mpich2 cmake leveldb doxygen];

  src = fetchgit {
    url = "https://github.com/Eyescale/Lunchbox.git";
    
    rev = "cf29f6132771889f1c5f53335f599fe329911832";
    sha256 = "1d41ry3ims9h1cxjc1wg0i8x9g8wvwpqxl4zrm4dcxl43rrcl04g";
  };
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
  '';
    

  enableParallelBuilding = true;
  
}



