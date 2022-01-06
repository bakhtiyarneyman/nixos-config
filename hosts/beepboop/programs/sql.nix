{ pkgs
, lib
, ...
}:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  systemd.services.mysql.wantedBy = lib.mkForce [ ];
}
