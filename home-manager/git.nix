{
  enable = true;
  userName = "kalscium";
  userEmail = "kalscium@protonmail.com";

  ignores = [
    "*~*" # pls no home
    "*.swp"
    "target" # for rust
    "book" # for mdbook
  ];

  extraConfig = {
    core.editor = "hx";
    init.defaultBranch = "main";
  };
}
