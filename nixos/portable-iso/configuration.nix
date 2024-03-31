{ pkgs, modulesPath, system, inputs, ... }@etc: let
  greenix = import ./../configuration.nix ({ inherit pkgs system inputs; } // etc);
in {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    inputs.home-manager.nixosModules.home-manager
  ];

  # Set System
  nixpkgs.hostPlatform = system;

  # Networking
  networking = {
    hostName = "portable-greenix";
    wireless.enable = false;
    networkmanager.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth = greenix.hardware.bluetooth;

  # Enable OpenGL
  hardware.opengl = greenix.hardware.opengl;

  # Set timezone
  time.timeZone = greenix.time.timeZone;

  # Set internationalisation properties
  i18n.defaultLocale = greenix.i18n.defaultLocale;
  i18n.extraLocaleSettings = greenix.i18n.extraLocaleSettings;

  # Set up Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Set up desktop portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable CUPS to print documents
  services.printing = greenix.services.printing;
  services.avahi = greenix.services.avahi; # to enable wifi printing

  # Enable sound with pipewire
  sound = greenix.sound;
  hardware.pulseaudio = greenix.hardware.pulseaudio;
  security.rtkit = greenix.security.rtkit;
  services.pipewire = greenix.services.pipewire;

  # Use the best default shell
  users.defaultUserShell = greenix.users.defaultUserShell;

  # Defines my user account
  users.users.greenchild = greenix.users.users.greenchild;

  # Configures home manager
  home-manager = greenix.home-manager;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = greenix.nixpkgs.config.allowUnfree;

  # Enable docker
  virtualisation.docker = greenix.virtualisation.docker;

  # Enable nix ld (for running of foreign binaries)
  programs.nix-ld = greenix.programs.nix-ld;

  # Installed Fonts
  fonts.packages = greenix.fonts.packages;

  # Packages installed on my system
  environment.systemPackages = 
    (with pkgs; [
      # CLIs
      docker
      wget
      curl
      neofetch
      wineWowPackages.waylandFull
      pandoc
      ffmpeg
      file
      bat
      mdbook
      parted

      # TUIs
      xplr
      tmux
      cmatrix
      helix
      testdisk

      # GUIs
      libsForQt5.dolphin
      qbittorrent
      gparted
      vlc
      keepassxc
      libsForQt5.okular
      wezterm
      libsForQt5.konsole
      kitty
      kate

      # Browsers
      firefox
      microsoft-edge

      # Dependencies
      thefuck
      exfatprogs
      texlive.combined.scheme-small

      # Critical
      home-manager
      gnumake
      gnupg
      zsh
      ntfs3g # ntfs support
      btrfs-progs # btrfs support
      cryptsetup # disk encryption
      polkit # for asking for sudo
      busybox # gnu c utils

      # Hyprland
      hyprland
      waybar
      libnotify
      dunst # for notifications
      swww # for wallpapers
      rofi-wayland # application launcher
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))
    ])
    ++ (import ./../../dev-flake/packages.nix { inherit pkgs; nur = inputs.nur; })
    ++ [ (import ./../../dev-flake/rust.nix { inherit pkgs system; }) ];

  # Enable GPG
  programs.gnupg.agent = greenix.programs.gnupg.agent;

  # Enable the OpenSSH daemon
  services.openssh = greenix.services.openssh;

  system.stateVersion = "24.05";

  # Enable flakes and nix command
  nix.settings.experimental-features = greenix.nix.settings.experimental-features;

  # Configure zsh
  programs.zsh = greenix.programs.zsh;

  # Configure git
  programs.git = greenix.programs.git;

  # Environmental variables
  environment.variables = greenix.environment.variables;
}
