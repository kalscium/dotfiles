{ pkgs, ... }:
{
  # misc gui editors
  home.packages = with pkgs; [
    # blender
    typora # markdown editor
    # lmms # music production software
    kdePackages.kdenlive # video editor
    audacity
    obsidian
    # freecad
    wezterm
    # krita # for drawing
    pixelorama # for pixel art
    godot # for game development
    gimp
    libreoffice-fresh
  ];
}
