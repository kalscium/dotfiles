{
  description = "GreenChild04's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        greenix = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
