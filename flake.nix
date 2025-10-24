{
  description = "NixOS";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-pkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz"; # For latest stable version
      #url = "github:Svenum/Solaar-Flake/main"; # Uncomment line for latest unstable version
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    solaar,
    ...
  } @ inputs: {
    nixosConfigurations.thinkpad-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        solaar.nixosModules.default
        ./configuration.nix
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
