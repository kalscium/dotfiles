# bat: cat improved

{
  programs.zsh.shellAliases.cat = "bat";
  programs.bat.enable = true;
  programs.bat.config = {
    theme = "gruvbox-dark";
  };
}
