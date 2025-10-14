{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "aljustiet";
  users.users.root = {
    shell = pkgs.fish;
  };

  users.groups.aljustiet = { };
  users.groups.network = { };
  users.groups.uinput = { };

  users.users.aljustiet = {
    isNormalUser = true;
    group = "aljustiet";
    uid = 1000;
    extraGroups = ["wheel" "network" "audio" "video" "input" "uinput"];
    shell = pkgs.zsh;
  };
}
