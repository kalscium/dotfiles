# required packages for my dev-flake and system

{ pkgs, nur }: let
  dev-clis = with pkgs; [
    eza # better `ls`
    fd # better `find`
    mdbook
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
    asciidoc-full
    wasmtime # JIT wasm & cranelift backend
    wasmi # wasm interpreter
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
    # libcxx # c++ standard library
  ];
in dev-clis ++ dev-tuis ++ dev-guis ++ lang-deps ++ rust-dev-deps ++ build-deps
