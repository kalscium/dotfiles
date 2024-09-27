{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock --immediate";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 60 * 5;
          on-timeout = "systemctl suspend";
          on-resume = "hyprlock --immediate";
        }
      ];
    };
  };
}
