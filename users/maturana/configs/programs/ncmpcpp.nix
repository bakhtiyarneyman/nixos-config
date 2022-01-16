{ config, ... }:

{
  programs.ncmpcpp = {
    enable = config.services.mpd.enable;
    mpdMusicDir = builtins.toPath config.services.mpd.musicDirectory;
    settings = {
      execute_on_song_change = "notify-send -t 5000 -a \"Ncmpcpp\" \"Now Playing\" \"$(mpc --format '%title% \\n%artist%' current)\"";
    };
  };
}
