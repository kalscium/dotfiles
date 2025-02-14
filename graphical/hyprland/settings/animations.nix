{
  # Hyprland animation conigurations
  wayland.windowManager.hyprland.settings.animations = let
    interval = "6.9";
    curve = "easeOut";
  in {
    enabled = true;

    bezier = [
      "default, 0, 1, 0, 1"
      "wind, 0.05, 0.69, 0.1, 1"
      "winIn, 0.1, 1.1, 0.1, 1"
      "winOut, 0.3, 1, 0, 1"
      "linear, 1, 1, 1, 1"
      "easeOut, 0.16, 1, 0.3, 1"
    ];

    animation = [
      "windowsIn, 1, ${interval}, ${curve}, slide"
      "windowsOut, 1, ${interval}, ${curve}, slide"
      "windowsMove, 1, ${interval}, ${curve}, slide"
      "workspaces, 1, 10, ${curve}, slide"
      "layers, 1, ${interval}, ${curve}, slide"
    ];
  };
}
