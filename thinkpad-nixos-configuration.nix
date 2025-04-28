{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./thinkpad-nixos-hardware.nix
      ./thinkpad-nixos-filesystems.nix
    ];

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

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

#  console = {
#    font = "ter-932n";
#    keyMap = lib.mkDefault "us";
#    useXkbConfig = true;
#  };
#
  console = {
    font = "ter-932n";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true;
    packages = [ pkgs.terminus_font ];
  };
  

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };
  

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
    fastfetch
    openssh
    fd
    doas
    htop
    btop
    tree
    tealdeer
    kitty
    bat
    ripgrep
    tokei
    kanata-with-cmd
    obsidian
    ayugram-desktop
    fd
    grim
    slurp
    gdu
    dust
    tidal-hifi
    bluetui
    keepassxc
    file
    ripgrep
    gcc
    lsd
    acpi
    gammastep
    geoclue2
    zoxide
    fzf
    uwsm
    leetcode-cli
    tutanota-desktop
    font-manager
    zathura
    cnijfilter2
    simple-scan
  ];

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      texlivePackages.gofonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.go-mono
    ];
  };
  

  programs.zsh.enable = true;

  users.groups.aljustiet = {
    gid = 1000;
  };
  
  users.users.aljustiet = {
    isNormalUser = true;
    group = "aljustiet";
    uid = 1000;
    extraGroups = [ "wheel" "network" "audio" "video" ];
    shell = pkgs.zsh;
  };
  

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.printing.enable = true;

  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
    users = ["aljustiet"];
    keepEnv = true; 
    persist = true;
  }];
  
  system.stateVersion = "25.05";
}
