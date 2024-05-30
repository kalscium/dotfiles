# required packages for my dev-flake and system

{ pkgs, nur }: let
  dev-clis = with pkgs; [
    eza # better `ls`
    fd # better `find`
    gh # github cli
    git
    github-backup
    docker
    mdcat # cat markdown
    wget
    curl
    neofetch
    wineWowPackages.waylandFull
    file # file-type checking
    bat # better cat
    gnupg
    busybox
    just # for saving and running project-specific commands
    zip
    gzip
    p7zip
    simple-http-server

    # mdbook
    mdbook
    mdbook-linkcheck
  ];

  dev-tuis = with pkgs; [
    tmux
    xplr # file explorer
    bacon
    helix
    lldb # llvm debugger
  ];

  dev-guis = with pkgs; [
    github-desktop
    vscodium
    # jetbrains.clion
    # git-lfs
    ghidra-bin
  ];

  lang-deps = with pkgs; [
    zig
    zls # zig language server
    gcc
    dotnet-sdk_8
    zulu # jdk
    jre8
    taplo # toml reader & analyzer
    asciidoc-full # better markdown
    python311
    pipx
    asciidoc-full
    wasmtime # JIT wasm & cranelift backend
    wasmi # wasm interpreter
    wasm-pack # for building rust wasm packages
    clang
  ];

  rust-dev-deps = with pkgs; [
    rust-analyzer
    rustfmt
    cargo-geiger
    nur.packages.${system}.wasm-server-runner
    renderdoc
    cargo-nextest
    cargo-hakari
    cargo-rdme
  ];

  build-deps = with pkgs; [
    pkg-config
    mold
    makeWrapper
    lld_17
    gcc-arm-embedded-7 # for robotics
    libclang
    openssl
    sccache
    gnumake
    glibc # c standard library
    libcxx # c++ standard library
    cmake
    alsa-lib
    fontconfig
    libxkbcommon
    libGL
  ];

  runtime-deps = with pkgs; [
    libxkbcommon
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
  ];
in dev-clis ++ dev-tuis ++ dev-guis ++ lang-deps ++ rust-dev-deps ++ build-deps ++ runtime-deps
