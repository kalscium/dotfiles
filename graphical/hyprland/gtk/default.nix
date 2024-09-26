{ pkgs, ... }:
{
  # Configure the cursur
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    name = "Catppuccin-Macchiato-Dark-Cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 32;
  };

  # Configure GTK
  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };

    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };

    font = {
      name = "JetBrains Mono";
      package = pkgs.jetbrains-mono;
      size = 11;
    };
  };
}
