{ config, pkgs, ... }: {
  home.username = "root";
  home.homeDirectory = "/root";

  home.stateVersion = "24.05";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file =
    (import ./home.nix { inherit config pkgs; }).home.file //
    (let
      absSymlink = config.lib.file.mkOutOfStoreSymlink;
    in {
      ".zshrc".source = ./include/zsh/root.zshrc;
    });

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
