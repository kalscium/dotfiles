{
  # extra system configurations
  system-config = { pkgs, hyprland, ... }: let
    hyprland-pkgs = hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    # Set up Hyprland
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = hyprland.packages.${pkgs.system}.hyprland;
    };

    # Set up desktop portal
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Some extra OpenGL configs
    hardware.opengl = {
      package = hyprland-pkgs.mesa.drivers;
      package32 = hyprland-pkgs.pkgsi686Linux.mesa.drivers;

      extraPackages = with hyprland-pkgs; [
        # OpenCL
        rocmPackages.clr.icd
        amdvlk
      ];

      # For 32bit apps
      extraPackages32 = with hyprland-pkgs; [
        driversi686Linux.amdvlk
      ];
    };

    # Cachix (so I don't have to recompile hyprland myself)
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # for apps that have hard-encoded HIP libraries
    systemd.tmpfiles.rules = let
      rocmEnv = hyprland-pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with hyprland-pkgs.rocmPackages; [
          rocblas
          hipblas
          clr
        ];
      };
    in [
      "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
    ];
  };

  home-manager = { config, pkgs, ... }: {
    # Configure Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      settings = import ./settings.nix;
    };
    
    # Configure GTK
    gtk = {
      enable = true;

      cursorTheme = {
        name = "Catppuccin-Macchiato-Dark-Cursors";
        package = pkgs.catppuccin-cursors.macchiatoDark;
      };

      gtk3 = {
        extraConfig.gtk-application-prefer-dark-theme = true;
      };
    };

    # Configure QT
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        name = "gtk2";
        package = pkgs.gruvbox-gtk-theme;
      };
    };

    # Configure the cursor
    home.pointerCursor = {
      gtk.enable = true;
      name = "Catppuccin-Macchiato-Dark-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
      size = 64;
    };
  };

  # extra packages
  packages = pkgs: with pkgs; [
    hyprland
    waybar # wayland side-bar
    libnotify
    mako # or dunst for notifications
    swww # for wallpapers
    wofi # or rofi-wayland as a application launcher
    hyprlock # for locking / sleep on hyprland
    qt6Packages.qt6ct # idk but it's a dependency
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];
}
