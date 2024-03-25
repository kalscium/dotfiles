# Packages installed on my system
pkgs: let
  clis = with pkgs; [
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
  ];

  tuis = with pkgs; [
    xplr
    tmux
    cmatrix # cool matrix text thing
    helix
    testdisk # for recovering ntfs files
  ];

  gui-utils = with pkgs; [
    libsForQt5.dolphin
    qbittorrent
    gparted
    discord
    vlc # video player
    keepassxc
    libsForQt5.filelight # disk usage statistics
    libsForQt5.okular
    calibre # ebook reader and organiser
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
    libsForQt5.konsole
    krita # for drawing
    kate
  ];

  browsers = with pkgs; [
    microsoft-edge
    # brave
    firefox
    # google-chrome
  ];

  games = with pkgs; [
    lunar-client
  ];

  dependencies = with pkgs; [
    thefuck # for zsh (console intellisense)
    exfatprogs # for gparted
    mediainfo # for kdenlive
    x264 # for kdenlive
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
    polkit # for asking for sudo
    busybox # gnu c utils replacement
    os-prober
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
