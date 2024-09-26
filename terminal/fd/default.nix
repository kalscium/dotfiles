# fd: find improved

{ pkgs, ... }:
{
  programs.zsh.shellAliases.find = "fd";
  home.packages = with pkgs; [
    fd
  ];
}
