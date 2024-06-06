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

  home-manager = { config, pkgs, catppuccin, ... }: {
    # Configure Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      settings = import ./settings.nix;
    };

    # Configure Gnome
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark"; # for GTK4 apps
      };
    };

    # Configure Catppuccin
    catppuccin = {
      enable = true;
      flavor = "macchiato";
      accent = "green";
    };

    # Configure Mako
    services.mako = {
      enable = true;
      catppuccin.enable = true;
    };

    # Configure Hyprlock
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 300;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "~/Pictures/Wallpapers/lock_screen.jpg";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            placeholder_text = "<span foreground=\"##cad3f5\">Password...</span>";
            shadow_passes = 2;
          }
        ];
      };
    };
    
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
      platformTheme.name = "gtk";
      style = {
        name = "gtk2";
        package = pkgs.gruvbox-dark-gtk;
      };
    };

    # Configure Cursor
    gtk.catppuccin.cursor = {
      enable = true;
      flavor = "mocha";
      accent = "green";
    };

    # Configure XDG
    xdg.configFile = {
      # Configure the QTCTs
      qt5ct = {
        target = "qt5ct/qt5ct.conf";
        text = pkgs.lib.generators.toINI { } {
          Appearance = {
            icon_theme = "Gruvbox";
          };
        };
      };
      qt6ct = {
        target = "qt6ct/qt6ct.conf";
        text = pkgs.lib.generators.toINI { } {
          Appearance = {
            icon_theme = "Gruvbox";
          };
        };
      };
      hyprland-portals = {
        target = "xdg-desktop-portal/hyprland-portals.conf";
        text = pkgs.lib.generators.toINI { } {
          preferred = {
            default = "hyprland;gtk";
          };
        };
      };
    };
  };

  # extra packages
  packages = pkgs: with pkgs; [
    wayland
    hyprland
    waybar # wayland side-bar
    libnotify
    mako # or dunst for notifications
    swww # for wallpapers
    wofi # or rofi-wayland as a application launcher
    hyprlock # for locking / sleep on hyprland
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    pavucontrol # for a gui sound controller
    wev # wayland event viewer
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];
}
