{ config, pkgs, inputs, nixgl, ... }:
#let 
#    myjdk21 = pkgs.jdk21;
#in
{
    
  imports =
    [ 
            ./jupyter.nix
      ./hardware-configuration.nix
      ./boot.nix
      ./desktop_manager.nix
      ./pkgs.nix
        ./network.nix
        ./users.nix
    ];
    options = {
    };

    config = {
  programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
 services.xserver.videoDrivers = [ "modesetting" ];
    programs.nix-ld.enable = true;
      virtualisation.waydroid.enable = true;
   # programs.nixgl = {
   #     enable = true;
   # };
        hardware.uinput.enable =true;
      virtualisation.docker.enable = true;
       # users.groups.input.members = ["sunshine"];
        
      # services.input-remapper.enable = true;


      time.timeZone = "America/Recife";

      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        LC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
      };

       services.xserver.enable = true;



      programs.dconf.enable = true;
       services.gnome = {
        gnome-keyring.enable = true;
      };
      
     xdg.portal = {
       enable = true;
       config = {
         common = {
           default = [ "xdph" "gtk" ];
           "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
           # "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
         };
       };
       # extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
     };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
          services.xserver.xkb = {
    layout = "br";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";




      # Enable CUPS to print documents.
      services.printing.enable = true;
        

      #sound.enable = true;
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        # alsa.enable = true;
        # alsa.support32Bit = false;
        # pulse.enable = true;
        #jack.enable = true;
        #media-session.enable = true;
      };

      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      programs.zsh.enable = true;

      
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search, run:
      # $ nix search wget
     # xdg.portal.enable = true;
     # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
     fonts.packages = with pkgs; [
           pkgs.nerd-fonts._0xproto
           pkgs.nerd-fonts.droid-sans-mono
            pkgs.nerd-fonts.hack
      # (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" "JetBrainsMono" ]; })
      openmoji-color
      gentium
      cantarell-fonts
      textfonts

    ];

    fonts.fontconfig.defaultFonts= {
        #monospace = ["Hack"];
        monospace = ["Hack"];
       # monospace = ["noto color emoji"];
      #  serif = [ "Gentium Plus" ];
      #  sansSerif = [ "Cantarell" ];
         emoji = ["OpenMoji Color"];
    };
      

      # programs.sway.enable = true;
     # security.polkit.enable = true;
     # security.sudo.configFile = "sunshine ALL=(ALL:ALL) ALL";
#         hardware.opengl = let
#   custom-mesa = pkgs.mesa .override {
#     enableTextureFloats = true;
#   };
# in {
#   package = pkgs.buildEnv {
#     name = "opengl-hack";
#     paths = [ pkgs.mesa custom-mesa custom-mesa.drivers pkgs.libtxc_dxtn_s2tc ];
#   };
        # hardware.graphics={
            # enable = true;
            # extraPackages= with pkgs; [ intel-media-driver intel-ocl intel-vaapi-driver mesa.drivers mesa ];
        # };
# };
         hardware.opengl = {
          enable = true;
          extraPackages = with pkgs;[ pkgs.mesa.drivers  libva-utils  mesa  ];
          # driSupport32Bit = true;
          # extraPackages = with pkgs; [ libva-utils  ];
      };
      # hardware.nvidia.modesetting.enable = true;
      # environment.etc."vicksy.jpg".source = ./vicksy.jpg;

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

      # Enable the OpenSSH daemon.
      # services.openssh.enable = true;

      system.stateVersion = "24.11"; 
    };
}
