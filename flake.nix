{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.aljustiet = {
            home.username = "aljustiet";
            home.homeDirectory = "/home/aljustiet";
            # Add this required field:
            home.stateVersion = "23.11";  # Match your NixOS version
            programs.zsh.enable = true;
            xdg.userDirs.enable = true;
          };
        }
      ];
    };
  };
}
