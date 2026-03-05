{ lib, ... }:
{
  imports = [
    ./user.nix
  ];

  programs.zsh.initContent = lib.mkForce (builtins.readFile ./root.zshrc);
}
