{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./thinkpad-nixos-hardware.nix
      ./thinkpad-nixos-filesystems.nix
    ];

  system.autoUpgrade.enable = true;

  documentation.man.generateCaches = false;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    wl-clipboard
    waybar
    rofi
    foot
    librewolf
    fastfetch
    openssh
    fd
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
    papirus-icon-theme
    vesktop
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
    gruvbox-gtk-theme
    gruvbox-kvantum
    libsForQt5.qt5ct
    qt6ct
    solaar
    logitech-udev-rules
    wine
    bottles-unwrapped
    terminus_font
    xh
    go
    poppler-utils
    epub2txt2
    ddcutil
    rwedid
    iotop
    lm_sensors
    brightnessctl
    fractal
    kdePackages.kdenlive
    shotcut
    unzip
    swayimg
    nh
    tor-browser
    qbittorrent
    swaynotificationcenter
    gitoxide
    bemoji
    obs-studio
    traceroute
    speedtest-go
    halloy
    brotli
    jq
    btrfs-progs
    gnome-sound-recorder
    trash-cli
    gimp3
    microfetch
    foliate
    python313Packages.git-filter-repo
  ];

  programs = {
    niri.enable = true;
    zsh.enable = true;
    fish.enable = true;
    dconf.enable = true;
    gnupg.agent.enable = true;
    kdeconnect.enable = true;
  };

  security = {
    polkit.enable = true;
    sudo = {
      execWheelOnly = true;
      extraRules = [
        { users = [ "aljustiet" ]; 
          commands = [{
            command = "ALL";
            options = ["SETENV" "NOPASSWD"];
          }];}
      ];
    };
  };

  services = {
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    mullvad-vpn.enable = true;
    vnstat.enable = true;
    flatpak.enable = true;
    tailscale.enable = false;
    auto-cpufreq = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
      };
    };
    i2c.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "thinkpad-nixos";
    networkmanager.enable = true;
    extraHosts = ''
      127.0.1.1 thinkpad-nixos.localdomain thinkpad-nixos
    '';
  };

  time.timeZone = "Asia/Tashkent";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "ru_RU.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "C.UTF-8";
    };
  };

  console = {
    earlySetup = true;
    font = "ter-v32n";
    packages = [ pkgs.terminus_font ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };

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

  system.stateVersion = "25.05";
}
