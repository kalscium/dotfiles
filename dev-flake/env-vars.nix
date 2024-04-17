# environmental variables for development
{
  CC = "gcc";
  CXX = "g++";
  LIBCLANG_PATH = /nix/store/mjzikzn3sn1hz7ns1l0013hdlsfcg58k-clang-17.0.6-lib/lib/libclang.so;
  OPENSSL_DIR = /nix/store/p25ghy7y53lyc834xnw5mrhfq096wa4x-openssl-3.0.13;
  RUSTC_WRAPPER = "sccache";
  PKG_CONFIG_PATH = [
    "/nix/store/n1ipj0ymgyd5blk8y19adra67gpc58sw-alsa-lib-1.2.11-dev/lib/pkgconfig"
    "/nix/store/39hr2fzdxa4l77vl1k7h1wbb1iir2y92-fontconfig-2.15.0-dev/lib/pkgconfig"
  ];
}
