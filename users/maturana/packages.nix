{ pkgs, ... }:

with pkgs; [
  # social
  discord
  element-desktop

  # text editors
  micro

  # documents
  #libreoffice-fresh

  # calendar and notes
  simplenote
  khal
  remind
  wyrd

  # image viwers
  imv

  # draw
  gimp
  inkscape

  # security
  bitwarden
  keepassxc

  # useful nix stuff
  nixpkgs-fmt
  nix-prefetch-git

  # tools
  editorconfig-core-c
  pamixer
  udisks2
  youtube-dl
  zip
  unzip
  cryptsetup
  qbittorrent
  imagemagick
  ffmpeg
  rofi
  bemenu
  openssl
  gcc
  cmake
  jq
  libnotify
  sox

  # wayland
  swayidle
  swaylock
  wl-clipboard
  grim
  slurp
  sway-contrib.grimshot
  wf-recorder
  wlsunset

  # useless things
  pfetch
]
