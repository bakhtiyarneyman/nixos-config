{ config
, ...
}:

{
  services.emacs = {
    enable = config.programs.emacs.enable;
    client.enable = true;
  };
}
