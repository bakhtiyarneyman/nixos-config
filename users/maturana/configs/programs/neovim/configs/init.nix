{ pkgs, ... }:

''
  ${import ./keybindings.nix}
  ${import ./plugins.nix { inherit (pkgs) lib; }}
''