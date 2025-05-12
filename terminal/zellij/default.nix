{ lib, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      theme = lib.mkForce "gruvbox-dark";
      default_shell = "zsh";
      show_startup_tips = false;
      copy_command = "wl-copy";
    };
  };

  # Layouts
  home.file = {
    ".config/zellij/layouts/rust.kdl".source = ./rust-layout.kdl;
    ".config/zellij/layouts/zig.kdl".source = ./zig-layout.kdl;
    ".config/zellij/layouts/dev.kdl".source = ./dev-layout.kdl;
  };
}
