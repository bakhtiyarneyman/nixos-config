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
    format = "{ifname}";
    format-wifi = " {essid} ({signalStrength}%)";
    format-ethernet = " {ipaddr}/{cidr}";
    format-disconnected = "Disconnected";
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
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
  };
}
