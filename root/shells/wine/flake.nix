{
  description = "A very basic flake";
  inputs = {
      nixpkgs.url = github:nixos/nixpkgs;
     # nixpkgs2.url = github:nixos/nixpkgs;
  };

  outputs = { self, nixpkgs}: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
   # pkgs2 = import nixpkgs2 {inherit system;};
    in{
        devShells."${system}".default = pkgs.mkShell{
           packages = with pkgs; [
               wineWowPackages.full
                winetricks
                # wineWayland
               # wineWowPackages.waylandFull
                    ];        
           buildInputs = with pkgs;[
          ];
        };
       
     };
}

