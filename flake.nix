{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
