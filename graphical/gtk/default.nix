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
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };

    font = {
      name = "JetBrains Mono";
      size = 11;
    };
  };
}
