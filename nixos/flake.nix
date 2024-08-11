{
  description = "Kalscium's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # dev inputs
    rust-overlay.url = "github:oxalica/rust-overlay";                    
    flake-utils.url = "github:numtide/flake-utils";                      
    nur.url = "github:polygon/nur.nix";                                  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, catppuccin, ... }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ (import inputs.rust-overlay) ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
          packageOverrides = import ./packageOverrides.nix;
        };
      };
    in {
      nixosConfigurations = {
        kalnix = nixpkgs.lib.nixosSystem { # for my default system
          specialArgs = { inherit inputs system hyprland pkgs catppuccin; };
          modules = [
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager
            ./configuration.nix
            catppuccin.nixosModules.catppuccin
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
