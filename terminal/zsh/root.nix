{ lib, ... }:
{
  imports = [
    ./user.nix
  ];

  programs.zsh.initExtra = lib.mkForce (builtins.readFile ./root.zshrc);
}
