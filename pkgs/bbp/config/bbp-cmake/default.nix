{stdenv, fetchFromGitHub}:

stdenv.mkDerivation rec {
  name = "bbp-cmake-2015R2";
  
  
  src = fetchFromGitHub {
  owner = "Eyescale";
  repo = "CMake";
    rev = "d65d84e2d8ba0210ae0697d43a05b08fbac66058";
    sha256 = "0b0v7ikir8x9h431613c24h8mm2q9kyiqjn6lzaxshnxn064ss09";
  };

  
  # enforce -WError for portable build is generally a bad practice
  # this cause any build with clang or recent boost version to fail 
  # due to external warnings
  # suppress it
  installPhase = ''
      sed -i 's@-Werror@@g' Compiler.cmake && 
      mkdir -p $out/share/bbp-cmake/Common &&
      cp -R *  $out/share/bbp-cmake/Common
    '';



} 
