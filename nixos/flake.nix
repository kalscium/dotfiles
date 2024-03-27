{
  description = "GreenChild04's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # dev inputs
    rust-overlay.url = "github:oxalica/rust-overlay";                    
    flake-utils.url = "github:numtide/flake-utils";                      
    nur.url = "github:polygon/nur.nix";                                  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ (import inputs.rust-overlay) ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {
        greenix = nixpkgs.lib.nixosSystem { # for my default system
          specialArgs = { inherit inputs system pkgs; };
          modules = [
            ./configuration.nix
          ];
        };

        portable = nixpkgs.lib.nixosSystem { # for my portable iso image
          specialArgs = { inherit inputs system pkgs; };
          modules = [
            ./portable-iso/configuration.nix
          ];
        };
      };
    };
}
