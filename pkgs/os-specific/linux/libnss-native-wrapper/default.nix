{stdenv}:
   
stdenv.mkDerivation {
  name = "libnss-native-wrapper-1.0";
   
  preferLocalBuild = true;

  buildCommand = ''
    # copy all libnss-* plugins 
    mkdir -p $out/lib 
    cp -r /lib/libnss_*.so* $out/lib 2> /dev/null || true
    cp -r /lib/*-linux-*/libnss_*.so* $out/lib  2> /dev/null || true
    
    # do the same for lib64   
    mkdir -p $out/lib64 
    cp -r /lib64/libnss_*.so* $out/lib64 2> /dev/null || true
    cp -r /lib64/*-linux-*/libnss_*.so* $out/lib64 2> /dev/null || true
    
  '';

  meta = { 
  
        description = "Wrapper to map native libnss plugins";

    };

}
