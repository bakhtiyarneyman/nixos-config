#!/usr/bin/env bash

# script based on https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vscode-extensions/update_installed_exts.sh

N="$1.$2"
EXTTEMP=$(mktemp -d -t vscode_exts_XXXXXXXXXXXXXXXXX)

URL="https://$1.gallery.vsassets.io/_apis/public/gallery/publisher/$1/extension/$2/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"

curl --silent -o "$EXTTEMP/$N.zip" "$URL"

echo $(nix-hash --flat --base32 --type sha256 "$EXTTEMP/$N.zip")
