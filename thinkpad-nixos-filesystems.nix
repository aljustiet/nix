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

  fileSystems."/home/aljustiet/btrfs" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvolid=5" "noatime" "rw" "ssd" "space_cache=v2" ];
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

  fileSystems."/nix/store" = {
    device = "/dev/disk/by-uuid/59a3572b-7420-48d0-852d-88f9ccd3db71";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "subvol=@nix-store-nixos" "noatime" "rw" "ssd" "space_cache=v2" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1A6B-00CA";
    fsType = "vfat";
    options = [ 
      "rw" 
      "noatime" 
      "fmask=0077"  # Stricter permissions (readable only by root)
      "dmask=0077"
    ];
  };

  # fileSystems."/mnt/hdd" = {
  #   device = "/dev/disk/by-uuid/1061-30F4";
  #   fsType = "exfat";
  #   options = [ "rw" "noatime" "uid=1000" "gid=1000" "iocharset=utf8" "nofail" ];
  # };

  # fileSystems."/mnt/usb" = {
  #   device = "/dev/disk/by-uuid/725D-EAFA";
  #   fsType = "exfat";
  #   options = [ "rw" "noatime" "uid=1000" "gid=1000" "fmask=0022" "dmask=0022" "iocharset=utf8" "errors=remount-ro" "nofail" ];
  # };

  swapDevices = [
    { device = "/dev/disk/by-uuid/36d76853-da22-4053-986b-f42d9a931315"; }
  ];

  zramSwap.enable = true;
}
