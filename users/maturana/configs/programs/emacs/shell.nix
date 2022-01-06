with import <nixpkgs>{};

# build vterm plugin

mkShell {
  name = "emacsenv";
  nativeBuildInputs = [ gcc gnumake cmake ];
  buildInputs = [ libvterm-neovim ];
}
