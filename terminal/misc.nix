# miscellaneous cli programs
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    distrobox
    podman
    wget
    curl
    neofetch
    pandoc
    file
    bat # cat improved
    mdbook
    parted
    monero-cli
    libwebp
    yt-dlp
    xplr # terminal file explorer
    cmatrix
    testdisk # for recovering ntfs systems
    gnumake
    gnupg
    ntfs3g # support for ntfs
    btrfs-progs # support for btrfs
    cryptsetup # or disk encryption
    busybox # gnu c utils replacement
    niv # nix dependency manager
    rm-improved # rip: better rm
    jq # json parsing
  ];
}