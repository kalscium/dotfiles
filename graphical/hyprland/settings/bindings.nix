{
  wayland.windowManager.hyprland.settings =
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
    # Bindings (Locked: will also work while laptop is locked)
    bindl = [
      # Laptop lid closed
      ", switch:on:Lid Switch, exec, systemctl suspend" # go to sleep
      ", switch:off:Lid Switch, exec, hyprlock --immediate" # lock it

      # to mute the laptop
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # panic button
      ", Insert, exec, shutdown -h now"
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

    # Bindings (Repeating)
    binde = [
      # Resize the window with vim-bindings
      "$mod ALT, L, resizeactive, 10 0"
      "$mod ALT, H, resizeactive, -10 0"
      "$mod ALT, K, resizeactive, 0 -10"
      "$mod ALT, J, resizeactive, 0 10"
    ];

    # Bindings
    bind = [  
      # Utils
      "$mod, M, exit,"
      "$mod, C, killactive,"
      "$mod, V, togglefloating,"
      "$mod, R, exec, $menu"
      # "$mod, P, pseudo," # dwindle
      # "$mod, J, togglesplit," # dwindle
      "$mod SHIFT, Z, exec, grimblast copysave area ~/Pictures/RandomScreenshots/Screenshot_$(date +'%Y%m%d_%H%M%S').png" # screenshot
      "$mod, X, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy" # clipboard

      # Open Apps
      "$mod, Q, exec, $terminal"
      ", MENU, exec, $terminal"
      "$mod, E, exec, $fileManager"
      "$mod, F, exec, librewolf"

      # Special workspace (scratchpad)
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"

      # Move the focus with arrowkeys
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Move the focus with vim-bindings
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      # Move the window with vim-bindings
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, J, movewindow, d"

      # Scroll through existing workspaces with mod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      # Scroll through existing workspaces with arrow keys
      "$mod CTRL, right, workspace, e+1"
      "$mod CTRL, left, workspace, e-1"
      "Shift Mod4, right, workspace, e+1"
      "Shift Mod4, left, workspace, e-1"
    ] ++ workspace-bindings;

    # more bindings
    bindm = [
      # Move/resize windows with mod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
