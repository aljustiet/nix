{ inputs, config, pkgs, lib, ... }: 
{
  imports = [
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-termfilechooser ];
  };
