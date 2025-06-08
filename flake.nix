{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      default = pkgs.callPackage ./package.nix {};
    };
    devShells.${system} = {
      default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.zola
          pkgs.tokei
        ];
        shellHook = ''
          ${pkgs.cowsay}/bin/cowsay Welcome to the devshell
        '';
      };
    };
  };
}
