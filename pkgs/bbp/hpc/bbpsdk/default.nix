{ stdenv, fetchgitPrivate, boost, lunchbox, brion, vmmlib, servus, cmake, bbp-cmake, mpiRuntime, pkgconfig, python, hdf5, doxygen }:

stdenv.mkDerivation rec {
  name = "bbpsdk-0.22.0-stable";
  buildInputs = [ stdenv pkgconfig boost brion vmmlib servus cmake bbp-cmake mpiRuntime lunchbox python hdf5 doxygen];

  src = fetchgitPrivate {
    url = "ssh://bbpcode.epfl.ch/common/BBPSDK";
    rev= "7c0e035207d310a99cdd1b4b26fbaa1d13dd3196";
    sha256 = "0830cgcnzdh9x699mxi388xfr3hh81ash0xgmkjd3myrv6h4w57q";
  };

# disable Java bindings
# disable git external maddness
# disable functional tests
  patchPhase= ''
	ln -s ${bbp-cmake}/share/bbp-cmake/Common CMake/common &&
	rm -rf \.gitsubprojects &&
	rm -rf \.gitexternals &&
	sed -i 's@message(FATAL_ERROR@message(STATUS@g' binds/CMakeLists.txt &&
	sed -i 's@add_subdirectory(tests)@@g' CMakeLists.txt
  '';
  

  enableParallelBuilding = true;
}

