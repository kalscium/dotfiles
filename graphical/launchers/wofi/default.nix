{
  programs.wofi = {
    enable = true;
    settings = {
      width = 450;
      height = 250;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      term = "kitty";
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };
  
    style = builtins.readFile ./style.css;
  };
}
