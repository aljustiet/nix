{ config, lib, pkgs, ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvol=@nixos" "noatime" "rw" "ssd" "space_cache=v2" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvol=@home-nixos" "noatime" "rw" "ssd" "space_cache=v2" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvol=@log-nixos" "noatime" "rw" "ssd" "space_cache=v2" ];
  };

  fileSystems."/var/cache" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvol=@cache-nixos" "noatime" "rw" "ssd" "space_cache=v2" ];
  };

  fileSystems."/nix-store" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvol=@nix-store-nixos" "noatime" "rw" "ssd" "space_cache=v2" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/13F9-09A9";
    fsType = "vfat";
    options = [ "rw" "noatime" "fmask=0022" "dmask=0022" "codepage=437" "iocharset=ascii" "shortname=mixed" "utf8" "errors=remount-ro" ];
  };

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/1061-30F4";
    fsType = "exfat";
    options = [ "rw" "noatime" "uid=1000" "gid=1000" "iocharset=utf8" "nofail" ];
  };

  fileSystems."/mnt/usb" = {
    device = "/dev/disk/by-uuid/725D-EAFA";
    fsType = "exfat";
    options = [ "rw" "noatime" "uid=1000" "gid=1000" "fmask=0022" "dmask=0022" "iocharset=utf8" "errors=remount-ro" "nofail" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/e0647b73-b396-4821-8c7b-f9b4e329852a"; }
  ];

  zramSwap.enable = true;
}
