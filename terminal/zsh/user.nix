{ config, ... }: {
  imports = [
    ./shellAliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = config.home.homeDirectory;

    initContent = builtins.readFile ./user.zshrc;
  };
}
