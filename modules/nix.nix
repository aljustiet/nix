{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: 

{
  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org/"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9UfP3dPH2seL5vhpL8/KznWhEaLGOfLOuV5SA="
    ];
  };
}
