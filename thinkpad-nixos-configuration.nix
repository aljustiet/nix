{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./thinkpad-nixos-hardware.nix
      ./thinkpad-nixos-filesystems.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "thinkpad-nixos";
  networking.extraHosts = ''
    127.0.1.1 thinkpad-nixos.localdomain thinkpad-nixos
  '';
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tashkent";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];

  console = {
    font = "ter-932n";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true;
  };

  programs.hyprland.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    wl-clipboard
    waybar
    fuzzel
    rofi-wayland
    foot
    librewolf
  ];

  programs.zsh.enable = true;
  users.users.aljustiet = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" "audio" "video"];
    shell = pkgs.zsh;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.printing.enable = true;

  system.stateVersion = "25.05";
}
