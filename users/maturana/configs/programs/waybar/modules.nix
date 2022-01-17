{ pkgs, ... }:

let
  scripts = ./scripts;
in
{
  "sway/workspaces" = {
    format = "{name}";
    disable-scroll = true;
    all-outputs = true;
  };
  "sway/mode" = {
    format = "{}";
    on-click = "swaymsg 'mode default'";
  };
  "custom/scratchpad_indicator" = {
    interval = 3;
    exec = "swaymsg -t get_tree | jq 'recurse(.nodes[]) | first(select(.name==\"__i3_scratch\")) | .floating_nodes | length | select(. >= 1)'";
    format = " {}";
    on-click = "swaymsg 'scratchpad show'";
    on-click-right = "swaymsg 'move scratchpad'";
  };
  "sway/window" = {
    format = "{}";
    max-length = 40;
    rewrite = {
      "(.*) - Mozilla Firefox" = " $1";
      "nvim (.*) /.*" = " $1";
      #"imv (.*) /.*" = " $1";
      "(.*) - VSCodium" = " $1";
    };
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
    exec-if = "pgrep bluetoothd";
    inteval = 5;
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
    #format-icons = [ "" "" "" "" "" ];
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
  "sway/language" = {
    format = "{short}({variant})";
    on-click = "swaymsg input '1:1:AT_Translated_Set_2_keyboard' xkb_switch_layout next";
  };
  "clock" = {
    format = "{:%H:%M}";
    format-alt = "{:%a, %d %b %Y}";
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
  };
}
