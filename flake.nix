{
  description = "Kalscium's home-manager dotfiles";

  inputs = {
    # nix packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    # all common components
    common = ./common.nix;

    # terminal
    terminal = ./terminal;
    helix = ./terminal/helix;
    zsh = {
      user = ./terminal/zsh/user.nix;
      root = ./terminal/zsh/root.nix;
    };
  };
}
