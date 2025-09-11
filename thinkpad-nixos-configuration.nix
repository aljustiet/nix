{ inputs, zen-browser, config, lib, pkgs, ... }:

{
  imports =
    [
      ./thinkpad-nixos-hardware.nix
      ./thinkpad-nixos-filesystems.nix
    ];

  environment.systemPackages = with pkgs; [
    niri
    neovim
    wget
    git
    wl-clipboard
    waybar
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
    bat
    ripgrep
    tokei
    kanata-with-cmd
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
    leetcode-cli
    tutanota-desktop
    font-manager
    zathura
    cnijfilter2
    simple-scan
    zsh
    fish
    brave
    xwayland-satellite
    smem
    yazi
    cliphist
    inputs.zen-browser.packages."${system}".default
    bibata-cursors
    vnstat
    noto-fonts-cjk-sans
    papirus-icon-theme
    vesktop
    noto-fonts-color-emoji
    pulsemixer
    xdg-user-dirs
    libqalculate
    evtest
    mullvad-vpn
    scrcpy
    android-tools
    dash
    komikku
    lsof
    topgrade
    dnsutils
    dig
    nwg-look
  ];

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
  
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      texlivePackages.gofonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.go-mono
      noto-fonts-cjk-sans
    ];
  };

  programs.zsh.enable = true;
  programs.fish.enable = true;

  users.users.root = {
    shell = pkgs.fish;
  };

  users.groups.aljustiet = {
    gid = 1000;
  };

  users.users.aljustiet = {
    isNormalUser = true;
    group = "aljustiet";
    uid = 1000;
    extraGroups = [ "wheel" "network" "audio" "video" "input" "uinput" ];
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
    noPass = true;
  }];
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
    };
  };

  services.mullvad-vpn.enable = true;
  
  system.stateVersion = "25.05";
}
