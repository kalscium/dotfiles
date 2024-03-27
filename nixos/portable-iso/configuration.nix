{ pkgs, modulesPath, system, inputs, ... }: {
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
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable OpenGL
  hardware.opengl.enable = true;

  # Set timezone
  time.timeZone = "Australia/Melbourne";

  # Set internationalisation properties
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Set up Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Set up desktop portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable CUPS to print documents
  services.printing.enable = true;
  services.avahi = { # to enable wifi printing
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Use the best default shell
  users.defaultUserShell = pkgs.zsh;

  # Defines my user account
  users.users.greenchild = {
    isNormalUser = true;
    description = "GreenChild";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Configures home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      greenchild = import ./../../home-manager/home.nix;
      root = import ./../../home-manager/root-home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Enable nix ld (for running of foreign binaries)
  programs.nix-ld = {
    enable = true;
    # Libraries for nix-ld
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
    ];
  };

  # Installed Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

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
      mako # for notifications
      swww # for wallpapers
      rofi-wayland # application launcher
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))
    ])
    ++ (import ./../../dev-flake/packages.nix { inherit pkgs; nur = inputs.nur; })
    ++ [ (import ./../../dev-flake/rust.nix { inherit pkgs system; }) ];

  # Enable GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  system.stateVersion = "24.05";

  # Enable flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure zsh
  programs.zsh = {
    enable = true;
    shellAliases = import ./../shellAliases.nix;
  };

  # Configure git
  programs.git.enable = true;

  # Environmental variables
  environment.variables = import ./../env-vars.nix // import ./../../dev-flake/env-vars.nix;
}
