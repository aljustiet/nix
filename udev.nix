{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  disableTouchpadWakeUp = true;
  enableMouseWakeUpRule = false;

  udevRules = [
  ] ++ (lib.optional disableTouchpadWakeUp ''
    KERNEL=="i2c-SYNA8018:00", SUBSYSTEM=="i2c", ATTR{power/wakeup}="disabled"
  '') ++ (lib.optional disableTouchpadWakeUp ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c548", ATTR{power/wakeup}="disabled"
  '');

in
{
  services.udev.extraRules = lib.concatStringsSep "\n" udevRules;
}
