{ pkgs, ... }:
{
  # Configure the GnuPG private key agent
  services.gpg-agent = {
    enable = true;
  };

  # Configure GnuPG
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;

    publicKeys = [ ];
  };
}
