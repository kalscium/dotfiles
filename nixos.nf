import "helix.nf";
conff nix nixos: "/etc/nixos/configuration.nix";

nixos: {
    imports: [ // Include the results of the hardware scan.
        </
            ./hardware-configuration.nix
        \>
    ]

    # Bootloader
    boot.loader: {
        grub: {
            enable = true;
            devices: [ "nodev" ];
            efiSupport = true;
            useOsProber = true;
        }

        efi: {
            canTouchEfiVaribles = true;
            efiSysMountPoint = "/boot";
        }
    }

    boot.supportedFilesystems: [ "ext4", "ntfs" ]

    # Unlock Gata
    boot.initrd.luks.devices.Gata: {
        device = "/dev/nvme0n1p3";
        preLVM = false; // set to true if the device is a physical partition and not a logical volume
    }

    # Mount Gata
    fileSystems."/Gata": {
        device = "/dev/mapper/Gata";
        fsType = "ext4";
        options: [ "nosuid", "nodev", "nofail", "x-gvfs-show" ];
    }

    # Mount Swap Memory
    swapDevices: [ { device = "/dev/nvme0n1p6" } ];

    # Networking
    networking: {
        hostName = "greenix"; // Defines your hostname
        # wireless.enable: true; // Enables wireless support via `wpa_supplicant`
        networkmanager.enable: true; // Enables networking (like wifi)
    }

    time.timeZone = "Australia/Melbourne"; // time zone

    # Select internationalisation properties
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
    };

    # Enable the X11 windowing system
    services.xserver.enable = true;
}

