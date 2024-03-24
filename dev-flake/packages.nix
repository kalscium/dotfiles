# required packages for my dev-flake and system

{ pkgs, nur }: let
  dev-tools = with pkgs; [
    openssl
    eza # better `ls`
    fd # better `find`
    helix
    bacon
    cargo-nextest
    cargo-hakari
    tmux
    mdbook
    gh
  ];

  dev-deps = with pkgs; [
    zig
    zls # zig language server
    gcc
    dotnet-sdk_8
    zulu
    taplo
    python311
    asciidoc-full
    wasmi
  ];

  rust-dev-deps = with pkgs; [
    rust-analyzer
    rustfmt
    lldb
    cargo-geiger
    nur.packages.${system}.wasm-server-runner
    renderdoc
  ];

  build-deps = with pkgs; [
    pkg-config
    mold
    clang
    makeWrapper
    lld_17
    gcc-arm-embedded-7 # for robotics
  ];
in dev-tools ++ dev-deps ++ rust-dev-deps ++ build-deps
