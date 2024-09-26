{
  imports = [
    ./shellAliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = builtins.readFile ./user.zshrc;
  };
}
