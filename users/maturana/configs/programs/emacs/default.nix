{
  programs.emacs = {
    enable = true;
  };

  home.file.".emacs.d" = {
    source = ./config;
    recursive = true;
  };
}
