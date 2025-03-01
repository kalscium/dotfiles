{ pkgs, ... }:
{
  # misc gui browsers
  home.packages = with pkgs; [
    # microsoft-edge
    librewolf
    mullvad-browser
  ];
}
