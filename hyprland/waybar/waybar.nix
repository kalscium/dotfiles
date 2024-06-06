pkgs: {
  enable = true;
  style = pkgs.lib.mkForce ./style.css;

  settings = {
    main_bar = {
      layer = "top";
      position = "top";

      # Choose the order of the modules
      modules-left = [ "keyboard-state" "custom/mem" "cpu" "temperature" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "backlight" "battery" "tray" ];

      # Modules configuration

      keyboard-state = {
        #numlock = true;
        capslock = true;
        format = "{name} {icon} ";
        format-icons = {
          locked = " ";
          unlocked = "";
        };
      };

      clock = {
        #timezone = "Australia/Melbourne"
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%a, %d %b %y, %I:%M %p}";
      };

      pulseaudio = {
        #"scroll-step" = 1; # %, can be a float
        reverse-scrolling = 1;

        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "{icon} {volume}% {format_source}";
        format-bluetooth-muted = "🎙❌  {icon} {format_source}";

        format-muted = "🔈❌ {format_source}";
        format-source = "🎙 {volume}%";
        format-source-muted = "🎙❌";

        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "🔈" "🔉" "🔊" ];
        };

        on-click = "pavucontrol";
        min-length = 13;
      };

      "custom/mem" = {
        format = "💭 {}B";
        interval = 3;
        exec = "free -h | awk '/Mem:/{printf $3}'";
        tooltip = false;
      };

      cpu = {
        format = "🐇 {avg_frequency}GHz   ⛏️ {usage}% {icon}";
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      };

      temperature = {
        #thermal-zone = 2;
        #kwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
        critical-threshold = 80;
        #format-critical = "{temperatureC}°C {icon}";
        format = "🌡️ {temperatureC}°C";
        tooltip = false;
      };

      backlight = {
        device = "amdgpu_bl1";
        format = "{icon} {percent}%";
        format-icons = [ "🌑" "🌘" "🌗" "🌖" "🌕" "☀️" ];
        min-length = 7;
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };

        format = "{icon} {capacity}%";
        format-charging = "{capacity}% ++";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [ "🪫" "🔋" ];

        on-update = "/usr/bin/env sh $HOME/.config/waybar/scripts/check_battery.sh";
      };

      tray = {
        icon-size = 16;
        spacing = 0;
      };
    };
  };
}
