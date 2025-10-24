{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  services.kanata = {
    enable = true;
    package = pkgs.kanata-with-cmd;
    keyboards.thinkpad.configFile = "/home/aljustiets/nix/modules/kanata/thinkpad-niri.kbd";
  };
}
