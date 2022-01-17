{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      output = "eDP-1";
      layer = "bottom";
      position = "top";
      modules-left = [ "sway/workspaces" "sway/mode" "custom/scratchpad_indicator" ];
      modules-right = [
        "tray"
        "pulseaudio"
        "network"
        "custom/bluetooth"
        "battery"
        "sway/language"
        "clock"
      ];
      modules = import ./modules.nix { inherit pkgs; };
    }];
    style = import ./style.nix { inherit (config) colorscheme; };
  };
}
