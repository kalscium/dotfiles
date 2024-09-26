{
  description = "Kalscium's home-manager dotfiles";

  inputs = {
    # nix packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    # all common components
    common = ./common.nix;

    # services
    services = {
      default = ./services;
      kanata = ./services/kanata;
    };

    # graphics
    graphical = {
      default = ./graphical;
    
      # launchers
      launchers = {
        default = ./graphical/launchers;
        wofi = ./graphical/launchers/wofi;
      };

      # bars
      bars = {
        default = ./graphical/bars;
        waybar = ./graphical/bars/waybar;
      };

      # hyprland
      hyprland = ./graphical/hyprland;
    };

    # terminal
    terminal = {
      default = ./terminal;
      helix = ./terminal/helix;
      zellij = ./terminal/zellij;
      wezterm = ./terminal/wezterm;
      misc = ./terminal/misc.nix;
      zsh = {
        user = ./terminal/zsh/user.nix;
        root = ./terminal/zsh/root.nix;
      };
    };
  };
}
