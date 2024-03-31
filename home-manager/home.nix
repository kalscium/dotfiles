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
      # Helix configs
      ".config/helix/config.toml".source = ./include/helix.toml;
      ".config/helix/languages.toml".source = ./include/helix-languages.toml;
      ".config/helix/themes/ttyeah.toml".source = ./include/ttyeah.toml;

      # Wezterm configs
      ".wezterm.lua".source = ./include/wezterm.lua;

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
    settings = (import ./../nixos/hyprland.nix).settings;
  };
}
