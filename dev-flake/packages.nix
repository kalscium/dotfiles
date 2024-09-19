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
    scriptisto # run compiled scripts
    cloc # for counting lines of source code
    curl
    cmake
    gnumake
    sqlite
    sccache
    fzf

    # mdbook
    mdbook
    mdbook-linkcheck
  ];

  dev-tuis = with pkgs; [
    zellij
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
    go
    nodejs_22
    haskell.compiler.native-bignum.ghcHEAD
    zls # zig language server
    gcc
    dotnet-sdk_8
    zulu # jdk
    jre8
    taplo # toml reader & analyzer
    asciidoc-full # better markdown
    python311
    pipx
    wasmtime # JIT wasm & cranelift backend
    wasmi # wasm interpreter
    wasm-pack # for building rust wasm packages
    clang
    libclang
    erlang_27
    gleam
    glas # a lsp for gleam
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
    cargo-bootimage # for writing my own operating system
  ];

  build-deps = with pkgs; [
    pkg-config
    mold
    makeWrapper
    lld_17
    gcc-arm-embedded-7 # for robotics
    pkgsCross.mingw32.buildPackages.gcc # for cross compiling to windows 32bit
    pkgsCross.mingwW64.buildPackages.gcc # for cross compiling to windows 32bit
  ];
in dev-clis ++ dev-tuis ++ dev-guis ++ lang-deps ++ rust-dev-deps ++ build-deps
