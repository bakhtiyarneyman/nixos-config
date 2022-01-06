{ pkgs
, config
, ...
}:

{
  home.packages = [ pkgs.mpc_cli ];

  services.mpd = {
    enable = true;
    musicDirectory = "/home/maturana/Music";
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };
    extraConfig = ''
      audio_output {
        type "pulse"
        name "pulse audio"
        device "pulse"
        mixer_type "hardware"
      }
      audio_output {
        type "fifo"
        name "my_fifo"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };
}
