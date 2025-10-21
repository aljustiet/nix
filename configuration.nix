{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./modules/filesystems.nix
    ./modules/hardware.nix
    ./modules/security.nix
    ./modules/udev.nix
    ./modules/uag.nix
    ./modules/solaar.nix
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
    #inputs.zen-browser.packages."${system}".default
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
    gruvbox-gtk-theme
    gruvbox-kvantum
    libsForQt5.qt5ct
    qt6ct
    logitech-udev-rules
    terminus_font
    xh
    poppler-utils
    epub2txt2
    ddcutil
    rwedid
    iotop
    lm_sensors
    brightnessctl
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
    nautilus
    xdg-desktop-portal-termfilechooser
    imagemagick
    qrencode
    jdk
    yt-dlp
    iw
    wavemon
    gh
    exiftool
    wshowkeys
    glow
    gnome-clocks
    ff2mpv-rust
    ghostty
    alacritty
    p7zip
    sd
    torsocks
    nvtopPackages.amd
    amdgpu_top
    calcurse
    batsignal
    killall
    bc
    wlogout
    monero-cli
    monero-gui
    pinta
    alejandra
    ripgrep-all
    btrfs-progs
    swaylock
    chess-tui
    fortune-kind
    cowsay
    spotify
    wl-screenrec
    btop-rocm
    efibootmgr
    gnome-calculator
    usbutils
  ];

  programs = {
    niri.enable = true;
    zsh.enable = true;
    fish.enable = true;
    dconf.enable = true;
    gnupg.agent.enable = true;
    kdeconnect.enable = true;
  };

  services = {
    gnome.gnome-keyring.enable = true;
    tailscale.enable = false;
    tor = {
      enable = true;
      torsocks.enable = true;
    };
    logind.settings.Login = {
      HandleLidSwitch = "ignore";
    };
    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
        cnijfilter2
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    mullvad-vpn.enable = true;
    vnstat.enable = true;
    flatpak.enable = true;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          energy_performance_preference = "performance";
          platform_profile = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          energy_performance_preference = "power";
          platform_profile = "low-power";
          turbo = "never";
          enable_thresholds = true;
          start_threshold = 20;
          stop_threshold = 80;
        };
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
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

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "thinkpad-nixos";
    networkmanager.enable = true;
    nftables.enable = true;
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
    packages = [pkgs.terminus_font];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.go-mono
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };

  system.stateVersion = "25.05";
}
