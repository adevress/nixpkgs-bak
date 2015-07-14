{ stdenv, 
fetchurl, 
python, 
perl, 
libibverbs }:

stdenv.mkDerivation {
  name = "mvapich2-2.1";

  src = fetchurl {
    url = "http://mvapich.cse.ohio-state.edu/download/mvapich/mv2/mvapich2-2.1.tar.gz";
    sha256 = "0bvvk4n9g4rmrncrgs9jnkcfh142i65wli5qp1akn9kwab1q80z6";
  };

  configureFlags = "--enable-shared --enable-sharedlib  --disable-fc --disable-f77";

  buildInputs = [ python perl libibverbs ];
  propagatedBuildInputs = stdenv.lib.optional (stdenv ? glibc) stdenv.glibc;

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "Implementation of the Message Passing Interface (MPI) standard";

    longDescription = ''
        This is an MPI-2 implementation which includes all MPI-1 features.  It is
        based on MPICH and MVICH.

    '';
    homepage = http://mvapich.cse.ohio-state.edu/news/;
    license = licenses.bsd2;
    platforms = platforms.unix; 
  };
}
