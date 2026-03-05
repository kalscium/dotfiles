{ pkgs, ... }:
{
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };
}
