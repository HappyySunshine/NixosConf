{ config, pkgs, inputs, nixgl, ... }:
#let 
#    myjdk21 = pkgs.jdk21;
#in
{
  users.users.jupyter.group = "jupyter";
  # users.users.wireshark.group = "wireshark";
  # users.users.wireshark = {           # isSystemUser= true;
  # group = "wireshark";
  # };
  users.groups.wireshark.members = [ "sunshine" ];
  users.groups.jupyter.members = [ "sunshine" ];
  users.users.sunshine = {
    isNormalUser = true;
    description = "happy sunshine";
    extraGroups = [ "wireshark" "networkmanager" "wheel" "uinput" "input" ];
    shell = pkgs.zsh;
  };


  users.defaultUserShell = pkgs.zsh;


  users.users.lfs = {
    isNormalUser = true;
    description = "binux from scratch";
    extraGroups = [ "networkmanager" "wheel" "uinput" "input" ];
  };

}
