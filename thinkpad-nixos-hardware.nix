{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "cryptdevice=PARTUUID=0662b013-d7cc-4a18-a207-d4eb49fd4068:luks"
                        "root=/dev/vg_group/btrfs"
                        "rootflags=subvol=@nixos"
                        "zswap.enabled=1"
                        "rw"
                        "rootfstype=btrfs"
                      ];

  boot.initrd.availableKernelModules = [ "nvme" "btrfs" "dm-crypt" "usbhid" "usb_storage" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.initrd.luks.devices.luks = {
    device = "/dev/disk/by-partuuid/0662b013-d7cc-4a18-a207-d4eb49fd4068";
    preLVM = true;
  };
  boot.initrd.services.lvm.enable = true;

  boot.kernelModules = [ "kvm-amd" "amdgpu" "btrfs"];

  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  
  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics.enable = true;
}
