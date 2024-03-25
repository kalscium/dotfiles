{
  LIBCLANG_PATH = "/nix/store/2l475hynw6hmxn81m3m4ka231z22kvk2-clang-11.1.0-lib/lib/libclang.so";
  OPENSSL_DIR = "/nix/store/y2hmc1ypa5yw54jsizxbn9gjag0d468k-openssl-3.0.10";
  PATH = "$PATH:/home/greenchild/.local/bin:$HOME/.cargo/bin";
  RUSTC_WRAPPER="sccache";
  NIX_LD = "/run/current-system/sw/share/nix-ld/lib/ld.so";
  NIX_STORE = "/nix/store";
}
