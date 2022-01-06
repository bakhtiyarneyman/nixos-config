{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        scheme-basic
        metafont
        xcolor
        latexmk
        wrapfig
        ulem
        capt-of
        dvipng;
    };
  };
}
