{ config, ... }:

{
  programs.ncmpcpp = {
    enable = config.services.mpd.enable;
    mpdMusicDir = builtins.toPath config.services.mpd.musicDirectory;
  };
}
