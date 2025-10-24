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
    thinkpad.configFile = "/home/aljustiet/.dotfiles/keyboard/kanata/thinkpad-niri.kbd";
  };
}
