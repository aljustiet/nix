{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    KERNEL=="i2c-SYNA8018:00", SUBSYSTEM=="i2c", ATTR{power/wakeup}="disabled"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c548", ATTR{power/wakeup}="disabled"
  '';
}
