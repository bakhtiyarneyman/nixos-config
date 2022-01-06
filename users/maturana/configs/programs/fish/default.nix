{ pkgs, config, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      mv = "mv -i";
      cp = "cp -i";
      rm = "rm -i";
      mkdir = "mkdir -p";

      parrot = "curl parrot.live";
    };
    shellAbbrs = {
      # cd
      ".." = "cd ..";
      ".2" = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      # systemd
      sctl = "systemctl";
      sctlu = "systemctl --user";

      # bluetooth
      bt = "bluetoothctl";
      btc = "bluetoothctl connect";
      btd = "bluetoothctl disconnect";
      bton = "bluetoothctl power on";
      btoff = "bluetoothctl power off";

      # youtube-dl
      ytdl = "youtube-dl";
      ytdlm = "youtube-dl -x --audio-format mp3";
      ytdlF = "youtube-dl -F";

      # udisks2
      diskin = "udisksctl mount -b";
      diskout = "udisksctl unmount -b";
      diskoff = "udisksctl power-off -b";

      # git
      gl = "git log";
      gs = "git status";
      ga = "git add";
      gsh = "git stash";
      gshs = "git stash save";
      gsha = "git stash apply";
      gshc = "git stash clear";
      gc = "git commit";
      gca = "git commit --amend";
      gb = "git branch";
      gbD = "git branch -D";
      gch = "git checkout";
      gchb = "git checkout -b";
      gpull = "git pull";
      gpush = "git push";

      # custom functions
      o = "open";
      ex = "extract";
    };
    interactiveShellInit = ''
      # disable startup shell message
      set fish_greeting

      fish_vi_key_bindings
    '';
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ (tty) = "/dev/tty1" ]
        ${lib.optionalString config.wayland.windowManager.sway.enable "exec sway"}
      end
    '';
    functions = {
      fish_prompt = ''
        printf "%s%s%s > " (set_color green) (prompt_pwd) (set_color normal)
      '';

      open = ''
        switch $argv[1]
          case '*.png' '*.jpg' '*.svg'
            imv $argv[1]
          case '*.pdf' '*.epub'
            zathura $argv[1]
          case '*.mp3' '*.mp4' '*.mkv' 'https://www.youtube.com/watch\?v=[a-zA-Z0-9_-]*'
            mpv $argv[1]
          case '*.txt' '*.md' '*.ms'
            less $argv[1]
          case '*'
            echo "Error: $argv[1] is not valid."
        end
      '';

      extract = ''
        switch $argv[1]
          case '*.tar.gz'
            tar zxf $argv[1]
          case '*.zip'
            unzip $argv[1]
          case '*'
            echo "Error: $argv[1] is not a valid file"
        end
      '';
    };

    plugins = import ./plugins.nix { inherit (pkgs) fetchFromGitHub; };
  };
}
