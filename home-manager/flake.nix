{
  description = "Home Manager configration of Kalscium";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.kalscium = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          (import ./../hyprland/hyprland.nix).home-manager
          home-manager.nixosModules.home-manager
          catppuccin.homeManagerModules.catppuccin
        ];
      };
      homeConfigurations.root = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./root-home.nix ];
      };
    };
}
