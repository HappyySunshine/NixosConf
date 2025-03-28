{ pkgs, ... }:
{
  imports = [
    ./nvim/neovim.nix
    ./alacritty.nix
    ./wezterm
    ./tmux
    ./hyprland
    ./eww
    #./xremap.nix
  ];
}
