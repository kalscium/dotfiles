{ pkgs, ... }:
{
  # Install Alacritty Themes
  home.packages = with pkgs; [
    alacritty-theme
  ];

  # Configure Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      "import" = [
        "~/.nix-profile/gruvbox_dark.toml"
      ];

      font = {
        size = 11;
      
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
      };
    };
  };
}
