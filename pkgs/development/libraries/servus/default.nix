{ stdenv, fetchgit, cmake, bbp-cmake, boost, pkgconfig, doxygen }:

stdenv.mkDerivation rec {
  name = "servus-1.1.0-stable";
  buildInputs = [ stdenv pkgconfig boost cmake bbp-cmake doxygen];

  src = fetchgit {
    url = "https://github.com/HBPVIS/Servus.git";
    
    rev = "0a5c5e4aeb6479e4ed6346b0aa9197a14d38afa4";
    sha256 = "05xdcqac2p7wp8p4xgs4h2i5415pvzg98fjsgpgxrxg1l1fjzhlj";
  };
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common
  '';
  

  enableParallelBuilding = true;
}




