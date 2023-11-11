// Import other system config files
import "helix.nf";
import "vscodium.nf";
import "zsh.nf";
import "plasma-kde.nf";

conff nix nixos: "/etc/nixos/configuration.nix";
nixos$ sudo nixos-rebuild switch --upgrade

nixos: {
    imports: [ // Include the results of the hardware scan.
        </
            ./hardware-configuration.nix
        \>
    ]

    // Bootloader
    boot.loader: {
        grub: {
            enable = true;
            devices: [ "nodev" ];
            efiSupport = true;
            useOSProber = true;
        }

        efi: {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
        }
    }

    boot.supportedFilesystems: [ "ext4", "ntfs" ]

    // Unlock Gata
    boot.initrd.luks.devices.Gata: {
        device = "/dev/nvme0n1p3";
        preLVM = false; // set to true if the device is a physical partition and not a logical volume
    }

    // Mount Gata
    fileSystems."/Gata": {
        device = "/dev/mapper/Gata";
        fsType = "ext4";
        options: [ "nosuid", "nodev", "nofail", "x-gvfs-show" ];
    }

    // Mount Swap Memory
    swapDevices: [ { device = "/dev/nvme0n1p6" } ];

    // Networking
    networking: {
        hostName = "greenix"; // Defines your hostname
        # wireless.enable: true; // Enables wireless support via `wpa_supplicant`
        networkmanager.enable: true; // Enables networking (like wifi)
    }

    time.timeZone = "Australia/Melbourne"; // time zone

    // Select internationalisation properties
    i18n.defaultLocale = "en_GB.UTF-8";
    i18n.extraLocaleSettings: {
        LC_ADDRESS = "en_AU.UTF-8";
        LC_IDENTIFICATION = "en_AU.UTF-8";
        LC_MEASUREMENT = "en_AU.UTF-8";
        LC_MONETARY = "en_AU.UTF-8";
        LC_NAME = "en_AU.UTF-8";
        LC_NUMERIC = "en_AU.UTF-8";
        LC_PAPER = "en_AU.UTF-8";
        LC_TELEPHONE = "en_AU.UTF-8";
        LC_TIME = "en_AU.UTF-8";
    }

    services.xserver: {
        // Enable the X11 windowing system
        enable = true;

        // Enable the KDE Plasma Desktop Environment
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;

        // Configure keymap in X11
        layout = "us";
        xkbVariant = "";

        // Enable touchpad support (enabled default in most desktopManagers)
        libinput.enable = true;

        // Enable automatic login
        displayManager.autoLogin: {
            enable = true;
            user = "greenchild";
        }
    }

    // Enable CUPS to print documents.
    services.printing.enable = true;

    // Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        // If you want to use JACK applications, uncomment this
        # jack.enable = true;

        // use the example session manager (no others are packaged yet so this is enabled by default,
        // no need to redefine it in your config for now)
        # media-session.enable = true;
    }

    // set zsh as default shell
    users.defaultUserShell = pkgs.zsh;

    // Defines my user account
    // (Don't forget to set a password with `passwd`)
    users.users.greenchild: {
        isNormalUser = true;
        description = "GreenChild";
        extraGroups: [ "networkmanager", "wheel" ];
    }

    // Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    // Enable docker
    # virtualisation.docker.enable = true;

    // Packages installed on my system
    environment.systemPackages: pkgs >> [
        ## [ Overrides ]
        // use an older version of vscodium cause the new one doesn't work
        # </
        #     (pkgs.vscodium.overrideAttrs (oldAttrs: rec {
        #         src = fetchurl {
        #             url = "https://github.com/VSCodium/vscodium/releases/download/${version}/VSCodium-linux-x64-${version}.tar.gz";
        #             sha256 = "a606e540f8dfe5a049513138adb01f03d6005cbb9b1b6a871688462ea51aa573";
        #         };
        #         version = "1.81.1.23222";
        #     }))
        # \>

        ## [ Programming Langs and Libs ]
        pipx
        libclang
        rustup
        python311
        python311Packages.pip
        dotnet-sdk
        gcc

        ## [ Programming Apps ]
        git
        bacon
        github-desktop
        cargo-ui
        vscodium
        jetbrains.clion
        cargo-expand

        ## [ Browsers ]
        microsoft-edge
        brave
        firefox // for publci wifi getway reasons

        ## [ Text Editors ]
        helix
        kate
        neovim

        ## [ TUI ]
        xplr // file explorer
        tmux

        ## [ CLI ]
        docker
        mdcat // terminal markdown displayer
        taplo // toml reader
        wget
        # curl
        neofetch
        wineWowPackages.minimal
        pandoc
        protonvpn-cli_2
        ffmpeg

        ## [ GUI ]
        qbittorrent
        gparted
        obsidian
        krita
        audacity
        discord
        vlc // video player
        libsForQt5.kdenlive // video editor
        typora // markdown editor

        ##  [ Dependencies ]
        gcc-arm-embedded-7 // for robotics
        thefuck // for zsh (console intellisense)
        exfatprogs // for gparted
        sccache // for speeding up rust compile time
        mediainfo // for kdenlive
        x264 // for kdenlive
        texlive.combined.scheme-small // for pandoc
        hunspell, hunspellDicts.uk_UA, hunspellDicts.th_TH // for libreoffice spell check

        ## [ Critical stuff ]
        gnupg
        zsh
        ntfs3g // support for ntfs mounting
        cryptsetup // for disk encryption
        polkit // for asking for sudo
        os-prober
        # bluez // for blooth (not working :C)

        ## [ Power saving ]
        powertop
        tlp

        ## [ School ]
        libreoffice-fresh
    ]

    // Some programs need SUID wrappers, can be configured further or are
    // started in user sessions.
    # programs.mtr.enable = true;
    programs.gnupg.agent: {
        enable = true;
        enableSSHSupport = true;
    }

    // List services that you want to enable:

    // Enable the OpenSSH daemon
    services.openssh.enable = true;

    // Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    // Or disable the firewall altogether.
    # networking.firewall.enable = false;

    system.stateVersion = "23.05";

    // Enable flakes and nix command
    nix.settings.experimental-features: [ "nix-command", "flakes" ];

    ## [ Zsh ]
    programs.zsh: {
        enable = true;
        shellAliases: {
            ll: "ls -l";
            clean: "nix-store --gc";
            full-clean: "sudo nix-collect-garbage -d";
            axolotl: "dotnet /Gata/Programs/Axolotl/Axolotl.dll /Gata/Ethan/Axolotl";
            configure: "sudo rm /etc/nixos/old_configuration.nix; sudo cp /etc/nixos/configuration.nix /etc/nixos/old_configuration.nix; sudo hx /etc/nixos/configuration.nix; sudo nixos-rebuild switch";
            configs: "cd /Gata/Ethan/Home/Github/personal-configs";
            claer: "clear";
            potato-farm: "/Gata/Programs/potato-farm";
            thoughts: "/Gata/Programs/thoughts";
            diary-cli: "/Gata/Ethan/Home/Github/diary-cli/target/release/diary-cli";
            gres: "/Gata/Programs/gres";
            onefig: "/Gata/Programs/onefig";
            nf: "/Gata/Programs/onefig";
            fix-ntfs: "sudo ntfsfix -d";
        };
    };

    ## [ Git ]
    programs.git.enable = true;

    ## [ Power Saving ]
    services.tlp.enable = true;
    services.power-profiles-daemon.enable = false;

    ## [ Env Varibles ]
    environment.variables: {
        LIBCLANG_PATH: "/nix/store/2l475hynw6hmxn81m3m4ka231z22kvk2-clang-11.1.0-lib/lib/libclang.so";
        OPENSSL_DIR: "/nix/store/y2hmc1ypa5yw54jsizxbn9gjag0d468k-openssl-3.0.10";
        # PATH: "$HOME/.local/bin:$HOME/.cargo/bin:$PATH" // `.cargo` and `.local` are already included in path by default
    }
}