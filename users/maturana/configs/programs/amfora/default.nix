{ pkgs
, ...
}:

{
  home.packages = [ pkgs.amfora ];

  xdg.configFile."amfora/config.toml".source = ./config.toml;
}
