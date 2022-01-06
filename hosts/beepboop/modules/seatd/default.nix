{ pkgs
, config
, lib
, ...
}:

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
      };

      group = mkOption {
        type = types.str;
        default = "seatd";
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
