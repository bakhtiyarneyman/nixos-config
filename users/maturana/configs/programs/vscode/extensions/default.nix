{ vscode-extensions, vscode-utils, lib, ... }:

with vscode-extensions; [
  # languages support
  jnoortheen.nix-ide
  (import ./julialang.language-julia.nix {
    inherit (vscode-utils) buildVscodeMarketplaceExtension;
    inherit lib;
  })

  # python and data science stuff
  ms-python.python
  ms-python.vscode-pylance
  ms-toolsai.jupyter

  # some useful tools
  esbenp.prettier-vscode
  yzhang.markdown-all-in-one
  donjayamanne.githistory

  # themes
  pkief.material-icon-theme
  (import ./jdinhlife.gruvbox.nix {
    inherit (vscode-utils) buildVscodeMarketplaceExtension;
    inherit lib;
  })
]
