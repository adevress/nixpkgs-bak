{ stdenv, fetchgit, cmake, bbp-cmake, doxygen, python, blas  }:

stdenv.mkDerivation rec {
  name = "vmmlib-1.8.0-stable";
  buildInputs = [ stdenv cmake bbp-cmake doxygen python blas];

  src = fetchgit {
    url = "https://github.com/Eyescale/vmmlib.git";
    rev= "eb372a2f7717c0d481dc2bf5389d77763ab8d759";
    sha256 = "1y92bsh7jny35g7w7mpj0vaarr94h9rv7j5mdvcjn29l4a4khvwh";
  };
  
  
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common && 
	sed 's@include(Buildyard)@@g' -i CMakeLists.txt &&
	sed 's@include(CPackConfig)@@g' -i CMakeLists.txt	
  '';
    

  enableParallelBuilding = true;
}


