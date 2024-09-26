{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
    cheese
    feather # monero wallet
  ];
}
