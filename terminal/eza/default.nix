{
  # Add shell alias
  programs.zsh.shellAliases.ls = "eza";
  
  # Configure eza
  programs.eza = {
    enable = true;
    git = true;
    icons = "always";
    enableZshIntegration = true;
  };
}
