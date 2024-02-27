{
  description = "GreenChild04's personal dev-shell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    nur.url = "github:polygon/nur.nix";
    naersk.url = "github:nix-community/naersk";
  };

  outputs = { self, ... }@inputs: with inputs; flake-utils.lib.eachDefaultSystem (system:
    let
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };

      rust-bin = pkgs.rust-bin.selectLatestNightlyWith
        (toolchain: toolchain.default.override {
          targets = [
            "wasm32-unknown-unknown"
            "x86_64-unknown-linux-gnu"
            "x86_64-unknown-linux-musl"
            "x86_64-pc-windows-gnu"
          ];
          extensions = [ "rust-src" ];
        });
      naersk-lib = naersk.lib.${system}.override {
        cargo = rust-bin;
        rustc = rust-bin;
      };

      dev-tools = with pkgs; [
        openssl
        eza
        fd
        helix
        bacon
        tmux
      ];
      dev-deps = with pkgs; [
        zig
        gcc
        dotnet-sdk
        taplo
        python311
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
        lld
      ];
      runtime-deps = with pkgs; [
        alsa-lib
        udev
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        xorg.libxcb
        libGL
        vulkan-loader
        vulkan-headers
      ];
      all-deps = dev-tools ++ dev-deps ++ rust-dev-deps ++ build-deps ++ runtime-deps ++ [ rust-bin ];
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = all-deps;
        shellHook = ''
          alias ls=eza
          alias find=fd
        '';

        # env variables
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath all-deps;
      };
    });
}