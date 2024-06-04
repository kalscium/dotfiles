# environmental variables for development
pkgs: {
  CC = "gcc";
  CXX = "g++";
  LIBCLANG_PATH = "${pkgs.libclang.lib}/lib/libclang.so";
  RUSTC_WRAPPER = "sccache";
  PKG_CONFIG_PATH = with pkgs; [
    "${openssl.dev}/lib/pkgconfig"
    "${fontconfig.dev}/lib/pkgconfig"
    "${alsa-lib.dev}/lib/pkgconfig"
  ];
}
