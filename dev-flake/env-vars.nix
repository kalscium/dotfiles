# environmental variables for development
{
  CC = "gcc";
  CXX = "g++";
  LIBCLANG_PATH = /nix/store/gvkk2m282cqh6m7yh4qrz3d7yhzlsd0i-clang-17.0.6-lib/lib/libclang.so.17.0.6;
  OPENSSL_DIR = /nix/store/8f10pxi30lvkdjrkzfw5gzz4rzia8163-openssl-3.0.13;
  RUSTC_WRAPPER = "sccache";
  PKG_CONFIG_PATH = [
    "/nix/store/l15qpvx3bagnjcsnqw21f9v8p7rsj91w-alsa-lib-1.2.11-dev/lib/pkgconfig"
    "/nix/store/dpgf3v45qli2irgvzhlm90q0i54iwsra-fontconfig-2.15.0-dev/lib/pkgconfig"
  ];
}
