{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: 

{
  services.solaar = {
    enable = true;
    package = pkgs.solaar;
    window = "hide";
    batteryIcons = "regular";
    extraArgs = "";
  };
}
