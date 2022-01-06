{ pkgs
, ...
}:

{
  services.syncthing = {
    enable = true;

    tray = {
      enable = false;
      command = "syncthingtray";
      package = pkgs.syncthingtray-minimal;
    };
  };

  # fix tray (https://github.com/nix-community/home-manager/issues/2064#issuecomment-887300055)
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
