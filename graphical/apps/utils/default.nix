{ pkgs, ... }:
{
  home.packages = with pkgs; [
    github-desktop
    thunar
    monitor
    qbittorrent
    discord
    vlc # video player
    keepassxc
    kdePackages.filelight # disk usage statistics
    kdePackages.okular
    calibre # ebook reader and organiser
    nomacs # image viewer
    networkmanagerapplet # for connecting to wifi
    kdePackages.ark
    thunderbird
    obs-studio
    cheese
    # feather # monero wallet
    teams-for-linux # for school
    spotify
  ];
}
