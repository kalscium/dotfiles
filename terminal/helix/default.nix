{ pkgs, ... }:
{
  imports = [
    ./ttyeah.nix
  ];

  # test if a language is supported, eg `hx --heath rust`
  home.packages = with pkgs; [
    # cpp dependencies
    clang-tools
    lldb
    # nix dependencies
    nil
    nixd
    # markdown
    markdown-oxide
    # toml
    taplo
    # rust
    rust-analyzer
    # zig
    zls
  ];

  programs.helix = {
    enable = true;
    package = pkgs.helix;
    defaultEditor = true;

    settings = {
      theme = pkgs.lib.mkForce "gruvbox";
      editor = {
        line-number = "relative"; # it's popular
        scrolloff = 999; # to keep the cursor centred
        mouse = false; # mice are for nerds
        soft-wrap.enable = true; # it just looks nicer

        # same as neovim
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };

    languages = {
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
        { name = "zig"; auto-format = false; }
        { name = "c"; auto-format = false; }
        { name = "cpp"; auto-format = false; }
      ];
    };
  };
}
