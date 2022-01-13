{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.mine.services.seatd;
in {
  options = {
    mine.services.seatd = {
      enable = mkEnableOption "seatd";

      package = mkOption {
        type = types.package;
        default = pkgs.seatd;
        example = literalExample "pkgs.seatd";
        description = "The seatd package to be installed";
      };

      group = mkOption {
        type = types.str;
        default = "seatd";
        example = literalExample "seat";
        description = "The group name that will have access to seatd";
      };
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    systemd.services.seatd = {
      serviceConfig = {
        RuntimeFilePreserve = true;
        Type = "oneshot";
        path = [ pkgs.bash ];
        ExecStart = "${pkgs.seatd}/bin/seatd -g ${cfg.group}";
        Group = cfg.group;
      };
      wantedBy = [ "multi-user.target" ];
    };

    users.groups = mkIf (cfg.group == "seatd") {
      seatd.name = "seatd";
    };
  };
}
