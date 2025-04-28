{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.thinkpad-nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./thinkpad-nixos-configuration.nix
      ];
    };
  };
}
