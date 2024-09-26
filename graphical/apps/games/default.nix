{ pkgs, ... }:
{
  # misc gui games
  home.packages = with pkgs; [
    lunar-client
    prismlauncher
  ];
}
