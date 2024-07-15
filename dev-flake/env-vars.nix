# environmental variables for development
pkgs: {
  CC = "gcc";
  CXX = "g++";
  LIBCLANG_PATH = "${pkgs.libclang.lib}/lib/libclang.so";
  RUSTC_WRAPPER = "sccache";
  PKG_CONFIG_SYSROOT_DIR = "/";
}
