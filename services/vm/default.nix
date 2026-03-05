{ pkgs, ... }:
{
  # Enable libvirt
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  # Enable libvirt USB redirection (optional)
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable virt-manager
  programs.virt-manager.enable = true;
}
