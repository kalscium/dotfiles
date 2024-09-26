{ pkgs, ... }:
{
  # misc gui browsers
  home.packages = with pkgs; [
    microsoft-edge
    # brave
    firefox-bin
    mullvad-browser
    # google-chrome
  ];
}
