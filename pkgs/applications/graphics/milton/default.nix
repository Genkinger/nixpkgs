{ clangStdenv, fetchurl, cmake, libGL, gtk2, pkgconfig, bash, glib }:

clangStdenv.mkDerivation rec {
  name = "milton-${version}";
  version = "1.6.2";

  buildInputs =  [ cmake libGL gtk2 ];
  nativeBuildInputs = [ pkgconfig ];
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  
  src = fetchurl {
    url = "https://github.com/serge-rgb/milton/archive/v1.6.2.tar.gz";
    sha256 = "11xc8ainjqa0llaqf3civbbxndh1xgqxwhdp2vz2mnifj7fw939g";
  };

  cmakeFlags = [
    "-DGTK2_GDKCONFIG_INCLUDE_DIR=${gtk2.out}/lib/gtk-2.0/include"
    "-DGTK2_GLIBCONFIG_INCLUDE_DIR=${glib.out}/lib/glib-2.0/include"
  ];

  meta = {
    description = "An infinite-canvas paint program";
  };

}