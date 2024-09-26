{
  # Enable libvirt
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  # Enable libvirt USB redirection (optional)
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable virt-manager
  programs.virt-manager.enable = true;
}
