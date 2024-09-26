{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    inputs.hypridle.packages.${pkgs.system}.default
    inputs.hypridle.packages.${pkgs.system}.default

    wayland
    hyprland
    waybar # wayland side-bar
    blueman # a bluetooth manager
    bluez # bluetooth
    libnotify # notifications
    mako # or dunst for notifications
    swww # for wallpapers
    hyprlock # for locking / sleep on hyprland
    pavucontrol # for a gui sound controller
    wev # wayland event viewer
    swayidle # idle manager for wayland
    grimblast # for screenshots
    wl-clip-persist # makes the clipboard persist after the program closes
    wl-clipboard # for clipboard
    cliphist # clipboard manager
    wdisplays # graphical display manager
    networkmanagerapplet
    brightnessctl # for setting the brightness of my monitor
    acpi # for checking the battery percentage
  ];
}
