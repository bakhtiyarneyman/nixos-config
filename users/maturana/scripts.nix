{ writeShellScriptBin, ... }:

let
  yes = writeShellScriptBin "yes" ''
    [ $# -eq 0 ] && while :; do echo "y"; done || while :; do echo "$@"; done
  '';
in [
  yes
]
