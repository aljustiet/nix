{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: 

{
  nix.settings.max-jobs = 16;
}
