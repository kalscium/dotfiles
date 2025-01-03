{ pkgs, ... }:
{
  imports = [
    ./ttyeah.nix
    ./languages.nix
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
        rulers = [72 80 120]; # just like how the C gods intended

        # same as neovim
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}
