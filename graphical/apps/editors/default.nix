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
    krita # for drawing
    libresprite # for pixel art
    pixelorama # also, for pixel art
    blender # for 3d modelling & cadding
    freecad # perhaps some day I'll professionally cad
    orca-slicer # for slicing 3d prints
    godot # for game development
    gimp
    libreoffice-fresh
  ];
}
