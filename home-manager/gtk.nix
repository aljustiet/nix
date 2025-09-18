{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 32;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };
  #gtk2 = {
  #  enable = true;
  #  iconTheme = "Papirus";
  #  cursorTheme = {
  #    name = "Bibata-Modern-Classic";
  #    size = 32;
  #  };
  #  font = {
  #    name = "JetBrainsMono Nerd Font";
  #    size = 12;
  #  };
  #};
}
