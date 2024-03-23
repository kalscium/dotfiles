# Packages installed on my system
pkgs: with pkgs; [
  ## [ Programming Langs and Libs ]
  # libclang
  # rustup
  python311
  # dotnet-sdk_8
  dotnet-runtime_8
  # gcc
  taplo # toml reader & analyzer
  asciidoc-full # better markdown
  wasmi # wasm interpreter
  # zulu # jdk
  # zulu8 # jdk 8
  # zig
  # lua

  ## [ Programming Apps ]
  git
  # bacon
  github-desktop
  vscodium
  # jetbrains.clion
  # git-lfs
  wezterm # terminal emulator
  ghidra-bin

  ## [ Browsers ]
  microsoft-edge
  # brave
  firefox
  # google-chrome

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
  wineWowPackages.waylandFull
  pandoc
  ffmpeg
  # cdrkit syslinux # for creating **bootable** iso files
  file # for checking the type of a file
  bat # cat but better
  darling # for running macOS apps
  testdisk # for recovering ntfs files
  cmatrix # cool matrix text thing
  # lldb # for debugging llvm compiled languages
  protonvpn-cli_2
  mdbook

  ## [ GUI Utils ]
  libsForQt5.dolphin
  qbittorrent
  gparted
  discord
  vlc # video player
  keepassxc
  libsForQt5.filelight # disk usage statistics

  ## [ GUI Editors ]
  blender
  typora # markdown editor
  lmms # music production software
  libsForQt5.kdenlive # video editor
  audacity
  obsidian
  freecad
  # krita # for drawing

  ## [ Games ]
  lunar-client

  ##  [ Dependencies ]
  # gcc-arm-embedded-7 # for robotics
  thefuck # for zsh (console intellisense)
  exfatprogs # for gparted
  sccache # for speeding up rust compile time
  mediainfo # for kdenlive
  x264 # for kdenlive
  texlive.combined.scheme-small # for pandoc
  zlib # for data-compression (rustc)

  ## [ Critical stuff ]
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
