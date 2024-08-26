let
  workspace-bindings = (
    # workspaces
    # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
    builtins.concatLists (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]
      )
      10)
  );
in {
  # Set default programs
  "$terminal" = "wezterm";
  "$fileManager" = "thunar";
  "$menu" = "wofi --show drun";

  # Monitor Setup
  monitor = ",preferred,auto,1";

  # Autostart
  exec-once = [
    "waybar"
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
    border_size = 3;

    "col.active_border" = "rgba(ffffffee)"; # white
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
    active_opacity = 1.0;
    inactive_opacity = 0.9;
    fullscreen_opacity = 1.0;

    drop_shadow = true;
    shadow_range = 30;
    shadow_render_power = 3;
    "col.shadow" = "rgba(1a1a1aee)";
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

  master.new_is_master = true;
  gestures.workspace_swipe = false;

  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    force_default_wallpaper = 0; # set to -1 for default anime wallpaper
  };

  # Custom per-device configurations
  # device = {};

  windowrulev2 = "suppressevent.maximise, class:.*";

  # Set the mod key
  "$mod" = "SUPER";

  # Bindings (Locked: will also work while laptop is locked)
  bindl = [
    # Laptop lid closed
    ", switch:on:Lid Switch, exec, hyprctl dispatch dpms off" # turn screen off
    ", switch:on:Lid Switch, exec, systemctl suspend" # go to sleep
    ", switch:off:Lid Switch, exec, hyprctl dispatch dpms on" # turn screen on
    ", switch:off:Lid Switch, exec, hyprlock --immediate" # lock it

    # to mute the laptop
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ];

  # Bindings (Locked & Repeating: will repeat while held and when laptop is locked)
  bindel = [
    # Audio keys
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

    # Brightness keys
    ", XF86MonBrightnessUp, exec, brightnessctl -d amdgpu_bl1 set 1%+"
    ", XF86MonBrightnessDown, exec, brightnessctl -d amdgpu_bl1 set 1%-"
    "Control_L, XF86MonBrightnessUp, exec, brightnessctl -d amdgpu_bl1 set 5%+"
    "Control_L, XF86MonBrightnessDown, exec, brightnessctl -d amdgpu_bl1 set 5%-"
    "SHIFT, XF86MonBrightnessUp, exec, brightnessctl -d amdgpu_bl1 set 1+"
    "SHIFT, XF86MonBrightnessDown, exec, brightnessctl -d amdgpu_bl1 set 1-"
  ];

  # Bindings
  bind = [  
    # Utils
    "$mod, M, exit,"
    "$mod, C, killactive,"
    "$mod, V, togglefloating,"
    "$mod, R, exec, $menu"
    "$mod, P, pseudo," # dwindle
    "$mod, J, togglesplit," # dwindle
    "$mod SHIFT, Z, exec, grimblast copysave area ~/Pictures/RandomScreenshots/Screenshot_$(date +'%Y%m%d_%H%M%S').png" # screenshot
    "$mod, X, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy" # clipboard

    # Open Apps
    "$mod, Q, exec, $terminal"
    ", MENU, exec, $terminal"
    "$mod, E, exec, $fileManager"
    "$mod, F, exec, firefox"

    # Special workspace (scratchpad)
    "$mod, S, togglespecialworkspace, magic"
    "$mod SHIFT, S, movetoworkspace, special:magic"

    # Move the focus with arrowkeys
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"

    # Scroll through existing workspaces with mod + scroll
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up, workspace, e-1"

    # Scroll through existing workspaces with arrow keys
    "$mod CTRL, right, workspace, e+1"
    "$mod CTRL, left, workspace, e-1"
  ] ++ workspace-bindings;

  # more bindings
  bindm = [
    # Move/resize windows with mod + LMB/RMB and dragging
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  # Some env vars
  env = [
    # Hint to electron apps to use wayland
    "NIXOS_OZONE_WL,1"
    "XCURSOR_SIZE,32"
    "QT_QPA_PLATFORMTHEME,qt6ct" # change to qt6ct if you have that
  ];
}
