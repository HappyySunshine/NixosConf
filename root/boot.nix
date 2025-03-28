{ ... }:
{
  security.pam.services.login.enableKwallet = true;
  security.pam.services.login.enableGnomeKeyring = true;
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
  # services.getty.autologinUser = "sunshine";


  boot.kernel.sysctl = { "vm.swappiness" = 50; };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      enable = true;
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
    };
  };
  #  boot.loader.systemd-boot.enable = true;
  #boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];
}
