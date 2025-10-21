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
    window = "show";
    batteryIcons = "regular";
    extraArgs = "";
  };
}
