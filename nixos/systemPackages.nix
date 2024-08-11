# Packages installed on my system
pkgs: let
  clis = with pkgs; [
    distrobox
    docker
    wget
    curl
    neofetch
    wineWowPackages.waylandFull
    pandoc
    ffmpeg
    file # file-type checker
    bat # better cat
    # darling # for running macOS apps
    protonvpn-cli_2
    mdbook
    parted
    monero-cli
    brightnessctl # to change the brightness of my screenb
    acpi # for checking the battery percentage
  ];

  tuis = with pkgs; [
    xplr
    tmux
    cmatrix # cool matrix text thing
    helix
    testdisk # for recovering ntfs files
  ];

  gui-utils = with pkgs; [
    xfce.thunar
    monitor
    qbittorrent
    discord
    vlc # video player
    keepassxc
    libsForQt5.filelight # disk usage statistics
    libsForQt5.okular
    calibre # ebook reader and organiser
    nomacs # image viewer
    networkmanagerapplet # for connecting to wifi
    libsForQt5.ark
    thunderbird
    obs-studio
    gnome.cheese
    feather
  ];

  gui-editors = with pkgs; [
    blender
    typora # markdown editor
    lmms # music production software
    libsForQt5.kdenlive # video editor
    audacity
    obsidian
    freecad
    wezterm
    krita # for drawing
    kate
    gimp
  ];

  browsers = with pkgs; [
    microsoft-edge
    # brave
    firefox-bin
    mullvad-browser
    # google-chrome
  ];

  games = with pkgs; [
    lunar-client
    prismlauncher
  ];

  dependencies = with pkgs; [
    thefuck # for zsh (console intellisense)
    exfatprogs # for gparted
    mediainfo # for kdenlive
    x264 # for kdenlive
    glaxnimate # for kdenlive
    texlive.combined.scheme-small # for pandoc
  ];

  critical = with pkgs; [
    home-manager
    gnumake # for building packages
    gnupg
    zsh
    ntfs3g # support for ntfs
    btrfs-progs # support for btrfs
    cryptsetup # for disk encryption
    busybox # gnu c utils replacement
    os-prober
    jmtpfs # for mounting my android phone
    xwaylandvideobridge # for screen sharing

    # polkit (for asking for sudo)
    polkit
    libsForQt5.polkit-qt
  ];

  power-saving = with pkgs; [
    powertop
    tlp
  ];

  school = with pkgs; [
    libreoffice-fresh
    cura # cura slicer (3D Printing)
    # super-slicer-latest # prusa slicer fork
  ];
in clis ++ tuis ++ gui-utils ++ gui-editors ++ browsers ++ games ++ dependencies ++ critical ++ power-saving ++ school
