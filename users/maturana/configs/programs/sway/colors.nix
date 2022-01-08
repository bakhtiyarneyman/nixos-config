{ colorscheme, ... }:

with colorscheme.colors; {
  focused = {
    border = "#${base0B}";
    background = "#${base0B}";
    text = "#${base00}";
    indicator = "#${base0E}";
    childBorder = "";
  };
  focusedInactive = {
    border = "#${base02}";
    background = "#${base02}";
    text = "#${base00}";
    indicator = "#${base0E}";
    childBorder = "";
  };
  unfocused = {
    border = "#${base02}";
    background = "#${base02}";
    text = "#${base06}";
    indicator = "#${base0E}";
    childBorder = "";
  };
  urgent = {
    border = "#${base0B}";
    background = "#${base0B}";
    text = "#${base00}";
    indicator = "#${base0E}";
    childBorder = "";
  };
}
