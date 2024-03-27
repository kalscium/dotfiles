{
  NIX_LD = "/run/current-system/sw/share/nix-ld/lib/ld.so";
  NIX_STORE = "/nix/store";
  # Hint electron apps to use wayland
  NIXOS_OZONE_WL = "1";
  PATH = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];
}
