{ pkgs, config, ... }:

with config;

let
  defaults = {
    summary-font = "${gtk.font.name}:size=12:weight=bold";
    title-font = "${gtk.font.name}:size=8:weight=bold:slant=italic";
    body-font = "${gtk.font.name}:size=10:weight=regular";
    sound-file = ./notification_song.mp3;
  };
in
{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        notification-margin = 15;
        icon-theme = gtk.iconTheme.name;
        play-sound = "${pkgs.sox}/bin/play \${filename}";
      };

      low = {
        inherit (defaults) summary-font title-font body-font sound-file;
        background = colorscheme.colors.base01;
        title-color = colorscheme.colors.base03;
      };

      normal = {
        inherit (defaults) summary-font title-font body-font sound-file;
        background = colorscheme.colors.base00;
        title-color = colorscheme.colors.base03;
        summary-color = colorscheme.colors.base05;
        body-color = colorscheme.colors.base06;
      };
    };
  };
}
