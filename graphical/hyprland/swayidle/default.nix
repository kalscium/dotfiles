{
  services.swayidle = {
    enable = true;
    timeouts = [
      { # turn off screen after 60 seconds
        timeout = 60;
        command = "hyprctl dispatch dpms off";
        resumeCommand = "hyprctl dispatch dpms on";
      }
      { # suspend after 5 minutes
        timeout = 60 * 5;
        command = "systemctl suspend";
        resumeCommand = "hyprlock --immediate";
      }
    ];
  };
}
