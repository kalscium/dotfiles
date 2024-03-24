{ inputs, pkgs, config, system, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.supportedFilesystems = [ "ext4" "ntfs" ];

  # Unlock Gata
  boot.initrd.luks.devices.Gata = {
    device = "/dev/disk/by-uuid/8e7b30e8-3737-4f38-b0c2-bdd10f5e2699";
    preLVM = false; # set to true if the device is a physical partition and not a logical volume
  };

  # Mount Gata
  fileSystems."/Gata" = {
    device = "/dev/disk/by-uuid/69ed7221-2318-4f35-84d8-03c36574739b";
    fsType = "ext4";
    options = [ "nosuid" "nodev" "nofail" ];
  };

  # Mount Boot
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6582-848B";
    fsType = "vfat";
  };

  # Mount Swap Memory
  swapDevices = [ { device = "/dev/disk/by-uuid/2134c6f9-dce6-4c0b-bb7a-d47793652c58"; } ];

  # Networking
  networking = {
    hostName = "greenix"; # Defines your hostname
    # wireless.enable = true; # Enables wireless support via `wpa_supplicant`
    networkmanager.enable = true; # Enables networking (like wifi)
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  }; 

  # Enable OpenGL
  hardware.opengl.enable = true;

  time.timeZone = "Australia/Melbourne"; # time zone

  # Select internationalisation properties
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

  # Enable the gui
  services.xserver = {
    # Enable the X11 windowing system
    enable = true;

    # Enable the KDE Plasma Desktop Environment
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xkb.layout = "us";
    xkb.variant = "";

    # Enable touchpad support (enabled default in most desktopManagers)
    libinput.enable = true;

    # Enable automatic login
    displayManager.autoLogin = {
      enable = true;
      user = "greenchild";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = { # to enable wifi printing
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # set zsh as default shell
  users.defaultUserShell = pkgs.zsh;

  # Defines my user account
  # (Don't forget to set a password with `passwd`)
  users.users.greenchild = {
    isNormalUser = true;
    description = "GreenChild";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Configures home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      greenchild = import ./../home-manager/home.nix;
      root = import ./../home-manager/root-home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow unsecure electron (remove later when they fix)
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

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
    (import ./systemPackages.nix pkgs) ++
    (import ./../dev-flake/packages.nix { inherit pkgs; nur = inputs.nur; }) ++
    [ (import ./../dev-flake/rust.nix { inherit pkgs system; }) ];

  # Some programs need SUID wrappers can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";

  # Enable flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable power saving
  powerManagement.enable = true;
  services.thermald.enable = false; # prevents cpu overheating
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      # Saves long-term battery health but is optional
      # START_CHARGE_THRESH_BAT0 = 40; # 40% and bellow will cause it to charge
      # STOP_CHARGE_THRESH_BAT0 = 80; # 80% and above will stop it from charging
    };
  };

  ## [ Zsh ]
  programs.zsh = {
    enable = true;
    shellAliases = import ./shellAliases.nix;
  };

  ## [ Git ]
  programs.git.enable = true;

  ## [ Env Varibles ]
  environment.variables = import ./env-vars.nix;
}
