{ lib, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings.theme = lib.mkForce "gruvbox-dark";
  };
}
