{
  enable = true;
  enableZshIntegration = true;

  extraConfig = ''
    -- extra configs in lua
    return {
      -- quick fix for wayland (hyprland) (remove later)
      enable_wayland = false,
    
      -- colour scheme
      color_scheme = "Gruvbox Dark (Gogh)",

      -- font
      font = wezterm.font "JetBrains Mono",
      font_size = 11,

      -- misc
      hide_tab_bar_if_only_one_tab = true,
    }
  '';
}
