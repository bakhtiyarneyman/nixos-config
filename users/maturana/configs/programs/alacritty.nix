{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = let font = "Cascadia Code"; in {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        bold_italic.family = font;
        size = 11;
        offset = { x = 0; y = 0; };
      };
    };
  };
}
