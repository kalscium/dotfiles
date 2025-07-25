# General settings for hyprland
{
  wayland.windowManager.hyprland.settings = {
    # Set default programs
    "$terminal" = "wezterm";
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
      kb_rules = "";

      repeat_delay = 250;
      repeat_rate = 25;

      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
      };

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification

      # remap CAPS to ESC
      # (redundant due to kanata, but nice to have)
      kb_options = [
        "caps:swapescape"
        "fkeys:basic13-24"
      ];
    };

    # General window layout and colours
    general = {
      gaps_in = 10;
      gaps_out = 20;
      border_size = 2;

      "col.active_border" = "rgb(ebdbb2)"; # gruvbox white
      "col.inactive_border" = "rgba(00000000)"; # match background colour
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
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;

      shadow = {
        enabled = true;
        range = 30;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
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
    ];
  };
}
