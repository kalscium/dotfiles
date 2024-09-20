{
  imports = [
    ./shellAliases.nix
  ];

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = builtins.readFile ./user.zshrc;
  };
}
