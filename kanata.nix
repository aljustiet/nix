# /etc/nixos/kanata.nix
{ config, pkgs, lib, ... }:

let
  kanata = pkgs.rustPlatform.buildRustPackage rec {
    pname = "kanata";
    version = "git";

    src = pkgs.fetchFromGitHub {
      owner = "jtroo";
      repo = "kanata";
      rev = "main";
      sha256 = lib.fakeSha256; # Replace with actual hash after first build
    };

    cargoLock = {
      lockFile = src + "/Cargo.lock";
    };

    nativeBuildInputs = with pkgs; [ pkg-config ];
    buildInputs = with pkgs; [ udev ];
  };
in
{
  environment.systemPackages = [ kanata ];

  services.kanata = {
    enable = true;
    package = kanata;
    configFile = "/etc/kanata/kanata.kbd";
  };

  systemd.services.kanata = {
    description = "Kanata Keyboard Remapper";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${kanata}/bin/kanata -c /etc/kanata/kanata.kbd";
      Restart = "always";
      RestartSec = 2;
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };
}
