{pkgs, inputs, hyprland, lib,...}:

{
 
 #     services.xserver.displayManager.autoLogin.user = "sunshine";
      #services.xserver.displayManager.autoLogin.enable = true;
       security.pam.services.login.enableGnomeKeyring = true;
    security.polkit.enable = true;
	services.xserver.enable =true;
#	services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.desktopManager.plasma5.enable = true ;
    programs.ssh.askPassword = lib.mkForce "${pkgs.plasma5Packages.ksshaskpass.out}/bin/ksshaskpass";

	systemd.services."getty@tty1".enable = true;
	systemd.services."autovt@tty1".enable = true;
      programs.hyprland =  {
        enable = true;
        package = hyprland;
    };

        services.xserver.displayManager.sddm.enable = true;
}
