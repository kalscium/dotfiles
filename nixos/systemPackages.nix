# Packages installed on my system
pkgs: with pkgs; [
  ## [ Programming Langs and Libs ]
  pipx
  libclang
  rustup
  python311
  python311Packages.pip
  dotnet-sdk
  gcc
  taplo # toml reader & analyzer
  lua

  ## [ Programming Apps ]
  git
  bacon
  github-desktop
  vscodium
  # jetbrains.clion
  # git-lfs
  wezterm # terminal emulator

  ## [ Browsers ]
  microsoft-edge
  # brave
  firefox # for publci wifi getway reasons

  ## [ Text Editors ]
  helix
  kate
  # neovim # why neovim when helix?

  ## [ TUI ]
  xplr # file explorer
  tmux

  ## [ CLI ]
  docker
  mdcat # terminal markdown displayer
  wget
  curl
  neofetch
  wineWowPackages.wayland
  pandoc
  ffmpeg
  # cdrkit syslinux # for creating **bootable** iso files
  file # for checking the type of a file
  bat # cat but better
  darling # for running macOS apps
  testdisk # for recovering ntfs files
  zlib # for data-compression (rustc)

  ## [ GUI ]
  qbittorrent
  gparted
  obsidian
  krita
  audacity
  discord
  vlc # video player
  libsForQt5.kdenlive # video editor
  typora # markdown editor
  keepassxc
  lmms # music production software
  libsForQt5.filelight # disk usage statistics
  blender

  ##  [ Dependencies ]
  gcc-arm-embedded-7 # for robotics
  thefuck # for zsh (console intellisense)
  exfatprogs # for gparted
  sccache # for speeding up rust compile time
  mediainfo # for kdenlive
  x264 # for kdenlive
  texlive.combined.scheme-small # for pandoc

  ## [ Critical stuff ]
  home-manager
  gnumake # for building packages
  gnupg
  zsh
  ntfs3g # support for ntfs mounting
  cryptsetup # for disk encryption
  polkit # for asking for sudo
  busybox # gnu c utils replacement
  os-prober

  ## [ Power saving ]
  powertop
  tlp

  ## [ School ]
  libreoffice-fresh
  cura # cura slicer (3D Printing)
  super-slicer-latest # prusa slicer fork

  ## [ AI ]
  # ollama # for running llms
  # python311Packages.huggingface-hub # for downloading llms from hugging face `huggingface-cli`
]
