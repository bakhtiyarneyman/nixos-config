{ pkgs
, ...
}:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
    font = {
      name = "Cascadia Code";
      size = 10;
      package = pkgs.cascadia-code;
    };
  };
}
