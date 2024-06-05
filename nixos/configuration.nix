{ pkgs, config, system, catppuccin, inputs, ... }: let
  hyprconfigs = import ../hyprland/hyprland.nix;
  dev-deps = (import ./../dev-flake/packages.nix { inherit pkgs; nur = inputs.nur; }) ++ [ (import ./../dev-flake/rust.nix { inherit system pkgs; }) ];
in rec {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    hyprconfigs.system-config
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

  # Enable the AMD graphics card driver
  boot.initrd.kernelModules = [ "amdgpu"];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.supportedFilesystems = [ "ext4" "ntfs" "btrfs" ];

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

  # Enable OpenGL & Enable Nvidia support
  hardware.nvidia.modesetting.enable = true;
  hardware.opengl = {
    enable = true;

    driSupport = true;
    driSupport32Bit = true;
  };

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

  # Enable touchpad support (enabled default in most desktop managers)
  services.libinput.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = { # to enable wifi printing
    enable = true;
    # nssmdns4 = true;
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
    jack.enable = true;

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
      greenchild = {
        imports = [
          ./../home-manager/home.nix
          (import ./../hyprland/hyprland.nix).home-manager
          catppuccin.homeManagerModules.catppuccin
        ];
      };
      root = import ./../home-manager/root-home.nix;
    };
  };

  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;
    # Allow unsupported packages (windows linker)
    allowUnsupportedSystem = true;
  };

  # Enable docker
  virtualisation.docker.enable = true;

  # Enable virtual machine
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable nix ld (for running of foreign binaries) programs.nix-ld = {
  programs.nix-ld = {
    enable = true;
    # Libraries for nix-ld
    libraries = dev-deps;
  };

  # Installed Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  # Packages installed on my system
  environment.systemPackages = (import ./systemPackages.nix pkgs)
    ++ dev-deps
    ++ hyprconfigs.packages pkgs;

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

  # Enable polkit
  security.polkit.enable = true;

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

  # Thunar
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };

  # Configure zsh
  programs.zsh = {
    enable = true;
    shellAliases = import ./shellAliases.nix;
  };

  # Configure git
  programs.git.enable = true;

  # Configure Parition Manager
  programs.partition-manager.enable = true;

  # Environmental variables
  environment.variables = pkgs.lib.mkForce (import ./env-vars.nix // import ./../dev-flake/env-vars.nix pkgs // { LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath environment.systemPackages; });
}
