{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (old: {
      patches = [
        (pkgs.fetchurl {
          url = "https://github.com/Alexays/Waybar/pull/1215.patch";
          sha256 = "1mxh94lrxyhj5sir1n5nd8qyzilmbmclshnmp7jvvj9fnd69ms8l";
        })
      ];
    });
    settings = [{
      output = "eDP-1";
      layer = "bottom";
      position = "top";
      modules-left = [ "mpd" ];
      modules-center = [ "river/tags" ];
      modules-right = [
        "tray"
        "network"
        "pulseaudio"
        "custom/bluetooth"
        "battery"
        "clock"
      ];
      modules = import ./modules.nix { inherit pkgs; };
    }];
    style = import ./style.nix { inherit config; };
  };
}
