# Configurations to make Hyprland work
{ pkgs, ... }:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;

  xdg = {
    enable = true;
    portal.enable = true;
    portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    portal.config.common.default = [ "xdg-desktop-portal-hyprland" "gtk" ];
  };
}
