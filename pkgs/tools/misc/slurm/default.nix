{ stdenv, fetchFromGitHub, perl, python, pkgconfig, openssl, munge ? null }:

stdenv.mkDerivation rec {
  name = "slurm-14.03.4-2";

  src = fetchFromGitHub {
    owner = "SchedMD";
    repo = "slurm";
    rev = "slurm-14-03-4-2";
    sha256 = "0vasb477qdsy8s4416kdfp2vg6qlyjviqhkpnrxycrifgppk74yn";
  };

  buildInputs =[perl python pkgconfig openssl];
  
  configureFlags =  "--sysconfdir=/etc/slurm --with-ssl=${openssl}
                    ${if munge != null then "--with-munge=${munge}" else "" }
                    ";

  meta = with stdenv.lib; {
    description = "Slurm: A Highly Scalable Workload Manager";
    homepage = http://slurm.schedmd.com/;
    license = licenses.gpl2;
    platforms = platforms.all;
    maintainers = with maintainers; [ adev ];
  };
}

