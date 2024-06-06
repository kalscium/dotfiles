{ config, pkgs, ... }: {
  home.username = "greenchild";
  home.homeDirectory = "/home/greenchild";

  home.stateVersion = "24.05";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = let
    absSymlink = config.lib.file.mkOutOfStoreSymlink;
  in {
    # Helix themes
    ".config/helix/themes/ttyeah.toml".source = ./include/ttyeah.toml;

    # Zsh configs
    ".zshrc".source = ./include/zsh/user.zshrc;

    # tmux configs
    ".tmux.conf".text = "
      set -s escape-time 0
      set -g default-terminal \"tmux-256color\"
      set -ag terminal-overrides \",xterm-256color:RGB\"
    ";

    # Cargo configs
    ".cargo/config.toml".source = ./include/cargo-config.toml;

    # Electron configs
    ".config/electron-flags.conf".source = ./include/electron-flags.conf;

    # Waybar configs
    ".config/waybar/macchiato.css".source = ./../hyprland/waybar/macchiato.css;
    ".config/waybar/scripts/check_battery.sh".source = ./../hyprland/waybar/scripts/check_battery.sh;

    ## [ Custom home symlinks ]
    # ".".source = absSymlink /Gata/GreenChild;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configure git
  programs.git = (import ./git.nix);

  # Configure Helix
  programs.helix = import ./helix.nix pkgs.lib;

  # Configure Wezterm
  programs.wezterm = import ./wezterm.nix;

  # Configure Waybar
  programs.waybar = import ./../hyprland/waybar/waybar.nix pkgs;

  # Configure Thunderbird
  programs.thunderbird = import ./thunderbird.nix;
}
