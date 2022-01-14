{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      output = "eDP-1";
      layer = "bottom";
      position = "top";
      modules-left = [ "sway/workspaces" "sway/mode" "custom/scratchpad_indicator" ];
      #modules-center = [ "sway/window" ];
      modules-right = [
        "tray"
        "network"
        "pulseaudio"
        "custom/bluetooth"
        "backlight"
        "battery"
        "sway/language"
        "clock"
      ];
      modules = import ./modules.nix { inherit pkgs; };
    }];
    style = import ./style.nix { inherit (config) colorscheme; };
  };
}
