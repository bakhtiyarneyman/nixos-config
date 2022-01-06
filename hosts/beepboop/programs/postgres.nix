{ lib
, ...
}:

{
  services.postgresql = {
    enable = true;
    initdbArgs = [ "--allow-group-access" ];
    authentication = lib.mkOverride 10 ''
      local all all               trust
      host  all all 127.0.0.1/32  trust
      host  all all ::1/128       trust
    '';
  };

  users.users.maturana.extraGroups = [ "postgres" ];
}
