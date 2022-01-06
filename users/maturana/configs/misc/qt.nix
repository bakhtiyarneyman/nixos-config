{ config
, ...
}:

{
  qt = {
    enable = config.gtk.enable;
    platformTheme = "gtk";
  };
}
