{ pkgs, ... }:
{
  imports = [
    ./helix
    ./zellij
    ./wezterm
    ./eza
    ./rip
    ./fd
    ./bat
  ];

  # misc cli programs
  home.packages = with pkgs; [
    python313
    git
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
    jq # json parsing
    github-backup
    mdcat # cat markdown
    wineWowPackages.waylandFull
    file # file-type checking
    gnupg
    just
    zip
    gzip
    p7zip
    scriptisto # run compiled scripts
    cloc # for counting lines of source code
    cmake
    gnumake
    fzf
    mdbook
  ];
}
