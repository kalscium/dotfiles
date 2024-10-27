{ lib, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      theme = lib.mkForce "gruvbox-dark";
      default_shell = "zsh";
    };
  };

  # Layouts
  home.file = {
    ".config/zellij/layouts/rust.kdl".source = ./rust-layout.kdl;
    ".config/zellij/layouts/dev.kdl".source = ./dev-layout.kdl;
  };
}
