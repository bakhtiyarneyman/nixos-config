{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.wayland.windowManager.river;
in
{
  options = {
    wayland.windowManager.river = {
      enable = mkEnableOption "River, a dynamic wayland compositor";

      package = mkOption {
        type = types.package;
        default = pkgs.river;
        example = literalExample "pkgs.river";
        description = "The River package to install";
      };

      config = mkOption {
        type = types.nullOr types.path;
        default = null;
        example = literalExample "./init";
        description = "Path to configuration file";
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."river/init" = mkIf (cfg.config != null) {
      source = cfg.config;
    };
  };
}