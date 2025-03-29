{ config, pkgs, bobox, inputs, lib, username, ... }:
let
  nixos_path = "/etc/nixos";
in
{

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  imports = [
    ./modules
  ];
  programs.git = {
    extraConfig.credential.helper = "manager";
    extraConfig.credential."https://github.com".username = "HappyySunshine";
    extraConfig.credential.credentialStore = "cache";
    enable = true;
    userName = "happyysunshine";
    userEmail = "happysunshine.pone@gmail.com";
  };

  home.packages = with pkgs; [
    git-credential-manager
    pavucontrol
    tmux
    whatsie
    vdhcoapp
    universal-ctags
    # TsS
    # inputs.xremap-flake.packages.${system}.default
    # tetex
    prismlauncher
    atlauncher
    bobox.grapejuice
    waydroid
    wireshark
    metabase
    texliveFull
    libreoffice-qt6

    # Network
    arp-scan
    nmap


    # notion

    hyprpaper
    hyprlock
    hypridle
    kitty
    grimblast
    spotify
    mako
    waybar
    eww
    swayimg
    xorg.xrandr
    brightnessctl
    zoxide
    thunderbird
    radare2
    openbox

    broot
    nnn

    steam-run
    #gui
    firefox
    discord
    # obs-studio
    lutris
    godot_4
    qbittorrent
    floorp
    gimp
    blender
    krita
    android-studio
    android-tools
    google-chrome
    brave
    # mysql
    # steam
    # q4wine
    # android-studio
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    defaultKeymap = "vicmd";
    dirHashes = {
      docs = "$HOME/Documents";
      vids = "$HOME/Videos";
      dl = "$HOME/Downloads";
      imgs = "$HOME/images";
    };
    dotDir = ".config/zsh";
    envExtra = ""; #.zshenv
    historySubstringSearch = {
      enable = true;
    };
    initExtra = ''
       dev(){
              nix develop /etc/nixos/root/shells/$1
              echo "ready to code $1!"
          }
      \builtin alias cd=__zoxide_z
      \builtin alias zi=__zoxide_zi
       eval "$(zoxide init zsh)"

       clear
       neofetch
    ''; #.zshrc
    oh-my-zsh = {
      extraConfig = "AGNOSTER_PROMPT_SEGMENTS=prompt_git";
      enable = true;
      theme = "agnoster";
      plugins = [
        "colorize"
        "cp"
        "sudo"
        "git"

      ];
    };
    shellAliases = {
      ".." = "cd ..";
      s = "sudo nixos-rebuild switch --flake /etc/nixos/";
      h = ''
        nix build ${nixos_path}/#homeConfigurations."${username}".activationPackage -o ${nixos_path}/result
        ${nixos_path}/result/activate
      '';
    };
    profileExtra = '''';

  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      dev(){
             nix develop /etc/nixos/root/shells/$1
             echo "ready to code $1!"
             }
    '';

    bashrcExtra = lib.mkDefault ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    # loginShellInit = "source ./scripts/alias.sh";

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      s = "sudo nixos-rebuild switch --flake /etc/nixos/";
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  # programs.steam = {
  #	enable = true;
  #	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #};
  # a regex pattern

  # starship - an customizable prompt for any shell
}
