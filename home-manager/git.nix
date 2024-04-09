{
  enable = true;
  userName = "GreenChild04";
  userEmail = "greenchild04@protonmail.com";

  ignores = [
    "*~*" # pls no home
    "*.swp"
    "target" # for rust
    "book" # for mdbook
  ];

  extraConfig = {
    safe.directory = [
      "/Gata/GreenChild/Github"
    ];
    core.editor = "hx";
    init.defaultBranch = "main";
  };
}
