{
  enable = true;
  defaultEditor = true;

  languages = {
    language = [
      { name = "rust"; auto-format = false; }
      { name = "toml"; }
      { name = "zig"; auto-format = false; }
    ];
  };

  settings = {
    theme = "gruvbox";
    editor = {
      line-number = "relative"; # it's popular :P
      mouse = false; # mice are for nerds
      soft-wrap.enable = true; # soft wrap looks nicer

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };
}
