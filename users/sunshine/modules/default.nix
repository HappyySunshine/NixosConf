{ pkgs, ... }:
{
  imports = [
    ./nvim/neovim.nix
    ./alacritty.nix
    ./systemd
    ./wezterm
    ./tmux
    ./hyprland
    ./eww
    #./xremap.nix
  ];
}
