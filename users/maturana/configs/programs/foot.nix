{ config, ... }:

{
  programs.foot = {
    enable = true;
    
    settings = {
      main = {
        app-id = "foot";
        title = "foot";
        term = "xterm-256color";
        font = "Cascadia Code PL:size=7.5";
      };

      bell = {
        urgent = "no";
        notify = "no";
      };

      colors = with config.colorscheme.colors; {
        alpha = 1.0;

        background = base00;
        foreground = base06;
        regular0 = base01;
        regular1 = base08;
        regular2 = base0B;
        regular3 = base0A;
        regular4 = base0D;
        regular5 = base0E;
        regular6 = base0C;
        regular7 = base06;
        bright0 = base02;
        bright1 = base08;
        bright2 = base0B;
        bright3 = base0A;
        bright4 = base0D;
        bright5 = base0E;
        bright6 = base0C;
        bright7 = base07;
      };
    };
  };
}
