{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: 

let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.niri}/bin/niri-session";
  username = "aljustiet";
in

{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${session}";
        user = "${username}";
      };
      default_session = {
        command = "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${session}";
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
    extraGroups = ["wheel" "network" "audio" "video" "input" "uinput"];
    shell = pkgs.zsh;
  };
}
