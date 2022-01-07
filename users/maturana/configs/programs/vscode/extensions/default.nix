{ vscode-extensions, vscode-utils, lib, ... }:

with vscode-extensions; [
  # languages support
  jnoortheen.nix-ide

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
] ++ (import ./custom.nix { inherit vscode-utils lib; })
