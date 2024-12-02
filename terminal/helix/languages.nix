{
  programs.helix.languages = {
    nixd-server = {
      command = "nixd";
      language-id = "nix";
    };

    language = [
      {
        name = "rust";
        language-servers = [ "rust-analyzer" ];
        auto-format = false;
      }
      {
        name = "markdown";
        auto-format = false;
      }
      {
        name = "nix";
        language-servers = [ "nil" ];
        auto-format = false;
      }
      {
        name = "c";
        auto-format = false;
        indent = {
          tab-width = 8;
          unit = "        ";
        };
      }
      {
        name = "cpp";
        auto-format = false;
        indent = {
          tab-width = 8;
          unit = "        ";
        };
      }
      { name = "zig"; auto-format = false; }

      {
        name = "asm";
        scope = "source.asm";
        file-types = [
          "s"
          "asm"
        ];
        roots = [];
      }
    ];
  };
}
