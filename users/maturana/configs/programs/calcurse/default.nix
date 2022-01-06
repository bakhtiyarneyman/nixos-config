{ pkgs
, ...
}:

{
  home.packages = [ pkgs.calcurse ];

  xdg.configFile.calcurse = {
    source = ./config;
    recursive = true;
  };
}
