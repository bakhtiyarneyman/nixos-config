{ pkgs
, ...
}:

{
  home.packages = [ pkgs.eww-wayland ];

  xdg.configFile.eww = {
    source = ./configs;
    recursive = true;
  };
}
