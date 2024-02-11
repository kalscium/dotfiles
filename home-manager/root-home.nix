{ config, pkgs, ... }: {
  home.username = "root";
  home.homeDirectory = "/root";

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
      ".config/helix/themes/ttyeah".source = ./include/ttyeah.toml;

      # Zsh configs
      ".zshrc".source = ./include/zsh/root.zshrc;

      # tmux configs
      ".tmux.conf".text = "set -s escape-time 0";

      ## [ Custom home symlinks ]
      Downloads.source = absSymlink /Gata/GreenChild/Downloads;
      Pictures.source = absSymlink /Gata/GreenChild/Pictures;
      ".cargo".source = absSymlink /Gata/Programs/rust/cargo;
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
