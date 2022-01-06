{ pkgs
, ...
}:

{
  home.packages = [ pkgs.vieb ];

  home.file.".vieb" = {
    source = ./config;
    recursive = true;
  };
}
