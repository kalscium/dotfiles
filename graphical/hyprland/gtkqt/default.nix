{
  # Configure GTK
  gtk = {
    enable = true;

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };

    gtk4 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  # Configure QT
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
}
