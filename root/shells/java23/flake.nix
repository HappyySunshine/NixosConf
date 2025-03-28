{
  description = "blender 4";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ jdk23 ];
        buildInputs = with pkgs; [
          jdk23
          (callPackage gradle-packages.gradle_8 {
            java = jdk23;
          })
        ];
      };

    };
}

