{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      execWheelOnly = true;
      extraRules = [
        {
          users = ["aljustiet"];
          commands = [
            {
              command = "ALL";
              options = ["SETENV" "NOPASSWD"];
            }
          ];
        }
      ];
    };
  };
}
