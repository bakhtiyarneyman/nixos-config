#!/usr/bin/env bash

function nix-system() {
    nix-store -qR /run/current-system/sw | wc -l
}

function nix-user() {
    local user=$(nix-store -qR /etc/profiles/per-user/$USER | wc -l)
    local home=$(nix-store -qR $HOME/.nix-profile | wc -l)

    echo $((user + home))
}

function total() {
    local system_pkgs=$(nix-system)
    local user_pkgs=$(nix-user)

    echo $((system_pkgs + user_pkgs))
}

tooltip="$(total) packages installed"

echo "{\"text\": \" $(nix-system)  $(nix-user)\",\"tooltip\": \"$tooltip\"}"