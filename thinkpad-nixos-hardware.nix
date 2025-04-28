{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "cryptdevice=PARTUUID=de12c19e-6319-45fc-a895-427d496df476:luks"
                        "root=/dev/vg_group/btrfs"
                        "rootflags=subvol=@nixos"
                        "zswap.enabled=1"
                        "rw"
                        "rootfstype=btrfs"
			"consolefont=ter-932n"
                      ];

  boot.initrd.availableKernelModules = [ "nvme" "btrfs" "dm-crypt" "usbhid" "usb_storage" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.initrd.luks.devices.luks = {
    device = "/dev/disk/by-partuuid/de12c19e-6319-45fc-a895-427d496df476";
    preLVM = true;
  };
  boot.initrd.services.lvm.enable = true;

  boot.kernelModules = [ "kvm-amd" "amdgpu" "btrfs"];

  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  
  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics.enable = true;
}
