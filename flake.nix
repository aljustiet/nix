{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  outputs = { self, nixpkgs, zen-browser, home-manager, ... } @ inputs:
  {
    nixosConfigurations.thinkpad-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./thinkpad-nixos-configuration.nix
      ];
      specialArgs = {
        inherit inputs zen-browser;
      };
    };
  };
}
