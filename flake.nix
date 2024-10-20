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
      thunar = ./services/thunar;
      vm = ./services/vm;
      powersave = ./services/powersave;
      docker = ./services/docker;
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

      # gtk & qt
      gtk = ./graphical/gtk;
      qt = ./graphical/qt;

      # apps
      apps = {
        default = ./graphical/apps;
        editors = ./graphical/apps/editors;
        browsers = ./graphical/apps/browsers;
        games = ./graphical/apps/games;
        utils = ./graphical/apps/utils;
      };
    };

    # terminal
    terminal = {
      default = ./terminal;
      helix = ./terminal/helix;
      zellij = ./terminal/zellij;
      wezterm = ./terminal/wezterm;
      alacritty = ./terminal/alacritty;
      eza = ./terminal/eza;
      rip = ./terminal/rip;
      fd = ./terminal/fd;
      git = ./terminal/git;
      zsh = {
        user = ./terminal/zsh/user.nix;
        root = ./terminal/zsh/root.nix;
      };
    };
  };
}
