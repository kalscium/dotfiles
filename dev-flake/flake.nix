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
      all-deps = (import ./packages.nix { inherit pkgs nur; }) ++ [ rust-bin ];
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = all-deps;
        shellHook = ''
          alias ls=eza
          alias find=fd
        '';
      } // import ./env-vars.nix pkgs all-deps;
    });
}
