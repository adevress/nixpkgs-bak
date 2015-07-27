{ stdenv, fetchgit, cmake, bbp-cmake, doxygen, python, blas  }:

stdenv.mkDerivation rec {
  name = "vmmlib-1.8.0-stable";
  buildInputs = [ stdenv cmake bbp-cmake doxygen python blas];

  src = fetchgit {
    url = "https://github.com/Eyescale/vmmlib.git";
    rev= "1fe52736d15c6f3a3f0b012e36765da0eef85932";
    sha256 = "0gbyzqkv1yq6njpkq57yi038si079c7xwl7ndpwqyflwhfmzb0hs";
  };
  
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common && 
	sed 's@include(Buildyard)@@g' -i CMakeLists.txt &&
	sed 's@include(CPackConfig)@@g' -i CMakeLists.txt	
  '';
    

  enableParallelBuilding = true;
}


