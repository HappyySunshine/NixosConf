{ pkgs, inputs, ... }:

{
  programs.wireshark.enable = true;

  programs.java = {
    enable = true;
    #package = pkgs.jdk21.override{};
    package = pkgs.jdk21;
  };
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };


  users.mysql = {
    enable = false;
    host = "localhost";
    user = "sunshine";
    database = "test";
    # passwordFile = /etc/nixos/mysql-passwd;
    nss = { };
    pam = {
      table = "users";
      userColumn = "username";
      passwordColumn = "password";
      passwordCrypt = "2";


    };
  };
  environment.systemPackages = with pkgs; [
    gdb
    gdb-dashboard
    inputs.nixgl

    wireshark
    vdhcoapp #firefox plugin to download vids
    btop
    unzip
    imagemagick
    vdhcoapp
    ffmpeg
    devbox
    #WAYLAND AND HYPRLAND
    # (pkgs.waybar.overrideAttrs (oldAttrs: {
    #  mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    # }))
    # nixgl.nixGLIntel
    #  mako
    xwaylandvideobridge
    grim
    slurp
    libnotify
    broot
    neofetch
    #  hyprpaper
    # swaybg
    # wpaperd
    # mpvpaper
    # swww
    # rofi-wayland
    # kitty
    #jdk21
    gradle
    #     minecraft
    #LSPS
    #rnix-lsp
    prismlauncher
    nixd
    clang-tools_16
    luajitPackages.lua-lsp
    neovim

    qucs-s
    #kicad

    #Utils
    git
    zsh
    wget
    curl
    zsh
    jq
    #  wineWowPackages.full


    #python39
    bun
    lua
    rust-analyzer-unwrapped
    clang-tools_16
    gparted
  ];
}
