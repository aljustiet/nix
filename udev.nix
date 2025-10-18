{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
}
