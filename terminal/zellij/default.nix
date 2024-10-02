{ lib, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings.theme = lib.mkForce "gruvbox-dark";
  };
}
