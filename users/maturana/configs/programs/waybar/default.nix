{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      output = "eDP-1";
      layer = "bottom";
      position = "top";
      modules-left = [ "mpd" ];
      modules-center = [ "river/tags" ];
      modules-right = [
        "tray"
        "pulseaudio"
        "network"
        "custom/bluetooth"
        "battery"
        "clock"
      ];
      modules = import ./modules.nix { inherit pkgs; };
    }];
    style = import ./style.nix { inherit config; };
  };
}
