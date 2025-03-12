{ system, nixpkgs, home-manager, inputs, hyprland, bobox, ... }:
let
  # username = "sunshine";
  # homeDirectory = "/home/${username}";
  # configHome = "${homeDirectory}/.config";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    # config.xdg.configHome = configHome;
    # overlays = [ nurpkgs.overlay ];
  };
    inherit inputs;
in{
    "sunshine" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
     extraSpecialArgs = { inherit inputs; inherit hyprland; inherit bobox; }; 

        #stateVersion = "24.05";
    modules = [ ./users/sunshine/home.nix];
  };
}
