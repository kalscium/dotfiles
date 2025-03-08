{ pkgs, ... }:
{
  # Configure GTK
  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };

    iconTheme = {
      # package = pkgs.gruvbox-dark-icons-gtk;
      # name = "gruvbox-dark";
      package = pkgs.reversal-icon-theme;
      name = "Reversal-icon-theme";
    };

    font = {
      name = "JetBrains Mono";
      package = pkgs.jetbrains-mono;
      size = 11;
    };
  };
}
