{ pkgs, ... }:
{
  imports = [
    ./nvim/neovim.nix
    ./alacritty.nix
    ./wezterm.nix
    ./tmux
    ./hyprland
    ./eww
    #./xremap.nix
  ];
}
