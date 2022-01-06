{ pkgs, lib, config, nix-colors, ... }:

let
  wallpaper = (nix-colors.lib { inherit pkgs; }).nixWallpaperFromScheme {
    scheme = config.colorscheme;
    width = 1920;
    height = 1080;
    logoScale = 5.0;
  };
in
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway-unwrapped;
    wrapperFeatures = { base = true; gtk = true; };
    xwayland = true;
    config = {
      input = {
        "*" = {
          xkb_layout = "us,us";
          xkb_variant = "colemak,intl";
          xkb_options = "caps:swapescape,grp:alt_shift_toggle";
        };
        "1267:91:Elan_Touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      output = {
        "eDP-1" = { bg = "${wallpaper} fill"; };
      };
      seat = {
        "1267:91:Elan_Touchpad" = {
          hide_cursor = "when-typing enable";
        };
      };
      gaps = {
        inner = 6;
        outer = 6;
      };
      window = {
        border = 3;
      };
      floating = {
        border = 3;
        criteria = [
          { app_id = "org.keepassxc.KeePassXC"; }
          {
            class = "firefox";
            title = "Picture-in-Picture";
          }
        ];
      };
      modifier = "Mod4";
      keybindings = let mod = config.wayland.windowManager.sway.config.modifier; in {
        "${mod}+Return" = "exec ${pkgs.foot}/bin/foot";
        "${mod}+p" = with config.colorscheme.colors; ''
          exec ${pkgs.bemenu}/bin/bemenu-run -p "" \
            --fn 'Cascadia Code 11' \
            --fb '#${base00}' --ff '#${base06}' \
            --nb '#${base00}' --nf '#${base06}' \
            --hb '#${base04}' --hf '#${base01}'
        '';

        # function keybindings
        "${mod}+F1" = "exec ${pkgs.brave}/bin/brave";

        "${mod}+Shift+c" = "kill";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+f" = "fullscreen toggle";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        # modes
        "${mod}+r" = "mode resize";
        "${mod}+m" = "mode moving";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";

        # scratchpad
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 5";
        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 5";
        "Shift+XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer --default-source -t";
        "Shift+XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer --default-source -i 5";
        "Shift+XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer --default-source -d 5";

        "Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save screen ${config.xdg.userDirs.pictures}/$(date +%m-%d-%Y_%H-%M-%S).jpg";
        "Shift+Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save window ${config.xdg.userDirs.pictures}/$(date +%m-%d-%Y_%H-%M-%S).jpg";
        "Control+Shift+Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save area ${config.xdg.userDirs.pictures}/$(date +%m-%d-%Y_%H-%M-%S).jpg";

        "XF86AudioPlay" = "exec ${pkgs.mpc_cli}/bin/mpc toggle";
        "XF86AudioPause" = "exec ${pkgs.mpc_cli}/bin/mpc toggle";
        "XF86AudioNext" = "exec ${pkgs.mpc_cli}/bin/mpc next";
        "XF86AudioPrev" = "exec ${pkgs.mpc_cli}/bin/mpc prev";
        "Shift+XF86AudioNext" = "exec ${pkgs.mpc_cli}/bin/mpc seek +10";
        "Shift+XF86AudioPrev" = "exec ${pkgs.mpc_cli}/bin/mpc seek -10";

        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 5";
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 5";

        # toggle waybar
        "${mod}+b" = "exec pkill -USR1 waybar";

        # layout
        "${mod}+v" = "splitt";
        "${mod}+t" = "layout toggle";

        "${mod}+q" = "reload";
        "${mod}+Shift+q" = "exec swaymsg exit";
      };
      modes = {
        resize = {
          "h" = "resize shrink width 50 px";
          "j" = "resize grow height 50 px";
          "k" = "resize shrink height 50 px";
          "l" = "resize grow width 50 px";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
        moving = {
          "h" = "move left 10";
          "j" = "move down 10";
          "k" = "move up 10";
          "l" = "move right 10";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };
      colors = with config.colorscheme.colors; {
        focused = {
          border = "#${base0B}";
          background = "#${base0B}";
          text = "#${base00}";
          indicator = "#${base0E}";
          childBorder = lib.mkForce "";
        };
        focusedInactive = {
          border = "#${base02}";
          background = "#${base02}";
          text = "#${base00}";
          indicator = "#${base0E}";
          childBorder = lib.mkForce "";
        };
        unfocused = {
          border = "#${base02}";
          background = "#${base02}";
          text = "#${base06}";
          indicator = "#${base0E}";
          childBorder = lib.mkForce "";
        };
        urgent = {
          border = "#${base0B}";
          background = "#${base0B}";
          text = "#${base00}";
          indicator = "#${base0E}";
          childBorder = lib.mkForce "";
        };
      };
      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
    };
    extraConfig = ''
      exec systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec mako
      exec swayidle -w \
        timeout 300 'swaylock -f -c 000000' \
        timeout 600 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
        before-sleep 'swaylock -f -c 000000' 
      exec eww daemon
      exec wlsunset -s 18:00 -S 06:00
      exec remind -z -k"notify-send -t 5000 'Remind' %s; play -q $REMINDERS_PATH/song/notification_song.mp3" $REMINDERS_PATH
    '';
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland

      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    '';
  };
}
