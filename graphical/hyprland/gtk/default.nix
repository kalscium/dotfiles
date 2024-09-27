{ pkgs, ... }:
{
  # Configure the cursur
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # Configure GTK
  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };

    # iconTheme = {
    #   package = pkgs.gruvbox-dark-icons-gtk;
    #   name = "oomox-gruvbox-dark";
    # };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      name = "JetBrains Mono";
      size = 11;
    };
  };
}
