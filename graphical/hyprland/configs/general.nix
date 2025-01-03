# general configurations for hyprland
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    # Set default programs
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "wofi --show drun";

    # Monitor Setup
    monitor = ",preferred,auto,1";

    # Autostart
    exec-once = [
      "waybar"
      "dunst"
      "swww-daemon"
      "wl-paste --type text --watch cliphist store" # stores only text data
      "wl-paste --type image --watch cliphist store" # stores only image data
    ];

    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      repeat_delay = 250;
      repeat_rate = 25;

      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
      };

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification
    };

    # General window layout and colours
    general = {
      gaps_in = 10;
      gaps_out = 20;
      border_size = 2;

      "col.active_border" = "rgb(ebdbb2)"; # gruvbox white
      "col.inactive_border" = "$color11"; # match background colour
      # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg"; # rainbow
      # "col.inactive_border" = "rgba(595959aa)"; # grey

      layout = "master";
      allow_tearing = false;
    };

    # General window decoration
    decoration = {
      rounding = 10;

      blur = {
        enabled = true;
        size = 3;
        passes = 1;

        new_optimizations = "on";
        blurls = "waybar";
        vibrancy = 0.1696;
      };

      # opacity
      active_opacity = 0.9;
      inactive_opacity = 0.6;
      fullscreen_opacity = 1.0;

      shadow = {
        enabled = true;
        range = 30;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      force_split = 2;
      preserve_split = true;
    };

    master.new_status = "master";
    gestures.workspace_swipe = false;

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0; # set to -1 for default anime wallpaper
    };

    # Custom per-device configurations
    # device = {};

    # Set the mod key
    "$mod" = "SUPER";

    # Some env vars
    env = [
      # Hint to electron apps to use wayland
      "NIXOS_OZONE_WL,1"
      "XCURSOR_SIZE,32"
      "QT_QPA_PLATFORMTHEME,qt6ct" # change to qt6ct if you have that
    ];

    # Extra window rules
    windowrulev2 = [
      "suppressevent.maximise, class:.*" # to suppress full-screen event notifications

      # The override opacity clause for each of the streaming services I might use
      "opacity 1.0 override, title: (.*(Mozilla Firefox|VLC|nomacs|Lunar Client).*)$"
    ];
  };
}
