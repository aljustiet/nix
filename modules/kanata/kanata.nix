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
    keyboards.thinkpad.configFile = ./thinkpad-niri.kbd;
  };

  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;
  users.groups.uinput = { };

  users.users.aljustiet.extraGroups = [ "uinput" ];

  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };
}
