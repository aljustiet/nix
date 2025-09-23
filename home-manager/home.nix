{ inputs, config, pkgs, lib, ... }: 
{
  imports = [
  ];
  programs = {
    mpv.enable = true;
    zen-browser.enable = true;
    zsh.historySubstringSearch.enable = true;
    fish = {
      enable = true;
      plugins = [
        {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
        }
      ];
    };
  };
  news.display = "silent";
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  home.username = "aljustiet";
  home.homeDirectory = "/home/aljustiet";
  xdg.userDirs.publicShare = "${config.home.homeDirectory}";
  xdg.userDirs.templates = "${config.home.homeDirectory}";
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "application/epub+zip" = "org.pwmt.zathura.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/chrome" = "zen-beta.desktop";
      "text/html" = "zen-beta.desktop";
      "application/x-extension-htm" = "zen-beta.desktop";
      "application/x-extension-html" = "zen-beta.desktop";
      "application/x-extension-shtml" = "zen-beta.desktop";
      "application/xhtml+xml" = "zen-beta.desktop";
      "application/x-entension-xhtml" = "zen-beta.desktop";
      "application/x-entension-xht" = "zen-beta.desktop";
      "image/jpeg" = "swayimg.desktop";
      "image/png" = "swayimg.desktop";
      "text/plain" = "nvim.desktop";
    };
  };
  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Light";
  };
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.gnome-session ];
  #  configPackages = [ pkgs.xdg-desktop-portal-gtk pkgs.gnome-session ];
  #  config.niri = {
  #    default = ["gnome" "gtk"];
  #    "org.freedesktop.impl.portal.FileChooser" = "gtk";
  #    "org.freedesktop.impl.portal.Notification" = "gtk";
  #    "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
  #  };
  #  config.common.default = "color-scheme";
  #  config.common."color-scheme" = "1";
  #};
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Light";
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 32;
    };
    iconTheme = {
      name = "Papirus";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style = {
      name = "kvantum";
    };
  };

  xdg.configFile."Kvantum/kvantum.kvconfig" = {
    # This will create the file ~/.config/Kvantum/kvantum.kvconfig
    source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General = {
        # Set the name of the Kvantum theme you have installed
        theme = "Gruvbox-Light";
      };
    };
  };

  xdg.configFile."qt5ct/qt5ct.conf" = {
    source = (pkgs.formats.ini {}).generate "qt5ct.conf" {
      Appearance = {
        style = "kvantum";
        icon_theme = "Papirus-Dark"; # Set your icon theme
      };
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "/home/aljustiet/Documents/foot/themes/gruvbox-dark";
        font = "JetBrainsMono Nerd Font:style=Regular:size=16";
        font-bold = "JetBrainsMono Nerd Font:style=Bold:size=16";
        font-italic = "JetBrainsMono Nerd Font:style=Italic:size=16";
        font-bold-italic = "JetBrainsMono Nerd Font:style=Bold Italic:size=16";
      };
    };
  };
  home.stateVersion = "25.05";
#  programs.waybar = {
#    enable = true;
#    settings = {
#      main = {
#        font = 
#      }
#    }
#  }
}

