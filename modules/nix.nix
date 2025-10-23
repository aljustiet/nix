{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: 

{
  boot.tmp.useTmpfs = true;
  boot.tmp.tmpfsSize = "50%";
  nix.settings = {
    max-jobs = 16;
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    substituters = lib.mkForce [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org/"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9UfP3dPH2seL5vhpL8/KznWhEaLGOfLOuV5SA="
    ];
  };
}
