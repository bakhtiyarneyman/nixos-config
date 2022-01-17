{ pkgs, ... }:

let
  scripts = ./scripts;
in
{
  "river/tags" = {
    num-tags = true;
    tag-labels = [
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
    ];
  };
  "tray" = {
    spacing = 8;
  };
  "custom/pkgs" = {
    format = "{}";
    exec = "${scripts}/pkgs.sh";
    return-type = "json";
    tooltip = true;
  };
  "custom/bluetooth" = {
    format = "{}";
    format-alt = "{alt}";
    exec = "${scripts}/bluetooth.sh --show";
    on-click-right = "${scripts}/bluetooth.sh --toggle";
    return-type = "json";
    interval = 5;
  };
  "network" = {
    interface = "wlp3s0";
    format = "直";
    format-alt = "直  {essid} ({signalStrength}%)";
    format-disconnected = "睊";
    max-length = 40;
  };
  "pulseaudio" = {
    format = "{icon} {volume}%  {format_source}";
    format-muted = "婢 muted {format_source}";
    format-source = " {volume}%";
    format-source-muted = " muted";
    format-bluetooth = "{icon} {volume}% {format_source}";
    format-icons = {
      default = [ "奄" "奔" "墳" ];
    };
    on-click = "${pkgs.pamixer}/bin/pamixer -t";
    on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
    scroll-step = 0.1;
  };
  "backlight" = {
    format = "{icon}";
    format-alt = "{icon} {percent}%";
    format-icons = [ "" "" ];
    tooltip = false;
  };
  "battery" = {
    format = "{icon}";
    format-alt = "{icon} {capacity}%";
    format-alt-plugged = "{icon} {capacity}%";
    format-icons = {
      default = [ "" "" "" "" "" "" "" "" "" "" "" ];
      plugged = [ "" "" "" "" "" "" "" ];
    };
    interval = 5;
    states = {
      warning = 30;
      critical = 15;
    };
    max-length = 25;
  };
  "clock" = {
    format = "{:%H:%M}";
    format-alt = "{:%a, %d %b %Y}";
    tooltip-format = "<big>{:%Y %B}</big>\n<small>{calendar}</small>";
  };
  "mpd" = {
    format = "{stateIcon} {artist} - {title}";
    format-disconnected = "ﱙ";
    format-stopped = "";
    state-icons = {
      paused = "";
      playing = "";
    };
    interval = 1;
    on-click = "${pkgs.mpc_cli}/bin/mpc toggle";
    on-click-right = "${pkgs.mpc_cli}/bin/mpc stop";
    on-scroll-up = "${pkgs.mpc_cli}/bin/mpc volume +1";
    on-scroll-down = "${pkgs.mpc_cli}/bin/mpc volume -1";
  };
}
