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
    keyboards.thinkpad.configFile = "./thinkpad-niri.kbd";
  };
}
