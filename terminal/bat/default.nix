# bat: cat improved

{ pkgs, ... }:
{
  programs.zsh.shellAliases.cat = "bat";
  home.packages = with pkgs; [
    bat
  ];
}
