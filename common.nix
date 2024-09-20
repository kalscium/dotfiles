{ pkgs, config, ... }:
{
  imports = [ ];

  home.packages = with pkgs; [ ];

  home.stateVersion = "24.05";
}
