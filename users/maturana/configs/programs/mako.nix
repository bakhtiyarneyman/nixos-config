{ config, ... }:

{
  programs.mako = with config.colorscheme.colors; {
    enable = true;
    layer = "top";
    anchor = "top-right";
    font = "Cascadia Code 11";
    padding = "8";
    borderRadius = 4;
    defaultTimeout = 10;

    textColor = "#${base06}";
    backgroundColor = "#${base00}";
    borderColor = "#${base02}";
    borderSize = 2;
  };
}
