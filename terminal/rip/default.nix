# rip: rm improved

{ pkgs, ... }:
{
  programs.zsh.shellAliases.rm = "rip";
  
  home.packages = with pkgs; [
    rm-improved
  ];
}
