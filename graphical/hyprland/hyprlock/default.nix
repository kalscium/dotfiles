{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = false;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = {
        monitor = "";
        path = "~/Pictures/Wallpapers/sun.png";
        color = "rgb(ebddbc)";
        blur_passes = 3;
        blur_size = 5;
        noise = 0.0117;
        contrast = 1.3;
        brightness = 0.8;
        vibrancy = 0.21;
        vibrancy_darkness = 0.0;
      };

      label = [
        # Current time
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
          color = "rgb(215,153,33)";
          font_size = 64;
          font_family = "JetBrains Mono Medium";
          position = "0, 256";
          halign = "center";
          valign = "center";
        }
        # User label
        {
          monitor = "";
          text = "-> <span size=\"larger\">$USER</span>";
          color = "rgb(152,151,26)";
          font_size = 20;
          font_family = "JetBrains Mono Medium";
          position = "0, -64";
          halign = "center";
          valign = "center";
        }
      ];

      image = {
        monitor = "";
        path = builtins.toString ../pfp_dark.png;
        size = 150;
        rounding = -1;
        border_size = 4;
        border_color = "rgba(0, 0, 0, 0)";
        reload_time = -1;
        position = "0, 128";
        halign = "center";
        valign = "center";
      };

      input-field = {
        monitor = "";
        size = "250, 50";
        outline_thickness = 3;
        dots_size = 0.2;
        dots_spacing = 1.0;
        dots_center = true; 
        outer_color = "rgb(104,157,106)";
        inner_color = "rgb(50,48,47)";
        font_color = "rgb(235,219,178)";
        check_color = "rgb(215,153,33)";
        fail_color = "rgb(204,36,29)";
        fade_on_empty = false;
        placeholder_text = "<i>Enter Password...</i>";
        position = "0, 0";
        hide_input = false;
        halign = "center";
        valign = "center";
      };
    };
  };
}
