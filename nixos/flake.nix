{
  description = "GreenChild04's NixOS flake";

  inputs = {
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable-nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # dev inputs
    rust-overlay.url = "github:oxalica/rust-overlay";                    
    flake-utils.url = "github:numtide/flake-utils";                      
    nur.url = "github:polygon/nur.nix";                                  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstable-nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "unstable-nixpkgs";
    };
  };

  outputs = { self, stable-nixpkgs, unstable-nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ (import inputs.rust-overlay) ];

      unstable-pkgs = import unstable-nixpkgs pkgs-inputs;
      stable-pkgs = import stable-nixpkgs pkgs-inputs;
      pkgs-inputs = {
        inherit system overlays;
        config = {
          allowUnfree = true;
          packageOverrides = import ./packageOverrides.nix;
        };
      };
    in {
      nixosConfigurations = {
        greenix = unstable-nixpkgs.lib.nixosSystem { # for my default system
          specialArgs = { inherit inputs system stable-pkgs unstable-pkgs; };
          modules = [
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager
            ./configuration.nix
          ];
        };

        portable = unstable-nixpkgs.lib.nixosSystem { # for my portable iso image
          specialArgs = { inherit inputs system; pkgs = unstable-pkgs; };
          modules = [
            ./portable-iso/configuration.nix
          ];
        };
      };
    };
}
