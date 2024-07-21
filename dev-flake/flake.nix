{
  description = "GreenChild04's personal dev-shell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    nur.url = "github:polygon/nur.nix";
  };

  outputs = inputs: with inputs; flake-utils.lib.eachDefaultSystem (system:
    let
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };

      rust-bin = import ./rust.nix { inherit pkgs system; };
      dev-deps = (import ./packages.nix { inherit pkgs nur; }) ++ [ rust-bin ];
      libraries = import ./libraries.nix pkgs;
    in {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = dev-deps;
        buildInputs = libraries;
        shellHook = ''
          alias ls=eza
          alias find=fd
        '';

        # env variables
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libraries;
      } // import ./env-vars.nix pkgs;
    });
}
