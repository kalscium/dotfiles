{ pkgs, ... }:
{
  # misc gui editors
  home.packages = with pkgs; [
    blender
    typora # markdown editor
    lmms # music production software
    libsForQt5.kdenlive # video editor
    audacity
    obsidian
    freecad
    wezterm
    krita # for drawing
    kate
    gimp
    libreoffice-fresh
  ];
}
