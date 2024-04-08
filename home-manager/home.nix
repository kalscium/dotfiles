{ config, pkgs, ... }: {
  home.username = "greenchild";
  home.homeDirectory = "/home/greenchild";

  home.stateVersion = "24.05";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file =
    let
      absSymlink = config.lib.file.mkOutOfStoreSymlink;
    in {
      # Helix themes
      ".config/helix/themes/ttyeah.toml".source = ./include/ttyeah.toml;

      # Zsh configs
      ".zshrc".source = ./include/zsh/user.zshrc;

      # tmux configs
      ".tmux.conf".text = "set -s escape-time 0";

      # Cargo configs
      ".cargo/config.toml".source = ./include/cargo-config.toml;

      ## [ Custom home symlinks ]
      # ".".source = absSymlink /Gata/GreenChild;
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configure git
  programs.git = {
    enable = true;
    userName = "GreenChild04";
    userEmail = "greenchild04@protonmail.com";
  };

  # Configure Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = (import ./../hyprland/hyprland.nix).settings;
  };

  # Configure Helix
  programs.helix = import ./helix.nix;

  # Configure Wezterm
  programs.wezterm = import ./wezterm.nix;

  # Configure Waybar
  programs.waybar = import ./../hyprland/waybar/waybar.nix;
}
