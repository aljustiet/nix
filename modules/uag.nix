{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: 

{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "aljustiet";
      };
      default_session = {
        # The change is inlined here
        command = "${pkgs.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${pkgs.niri}/bin/niri-session";
        user = "greeter";
      };
    };
  };

  users.groups.aljustiet = { };
  users.groups.network = { };
  users.groups.uinput = { };

  users.users.aljustiet = {
    isNormalUser = true;
    group = "aljustiet";
    uid = 1000;
    extraGroups = ["wheel" "network" "audio" "video" "input" "uinput" "disk"];
    shell = pkgs.zsh;
  };
}
