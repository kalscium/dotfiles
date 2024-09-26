{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 60;
        command = "hyprctl dispatch dpms off";
        resumeCommand = "hyprctl dispatch dpms on";
      }
    ];
  };
}
