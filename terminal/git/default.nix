{
  programs.git = {
    enable = true;

    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
    };
  };
}
