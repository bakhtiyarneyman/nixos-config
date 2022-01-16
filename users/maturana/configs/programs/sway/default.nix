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
      gaps = {
        inner = 6;
        outer = 6;
      };
      window = {
        border = 2;
      };
      floating = {
        border = 2;
        criteria = [
          { app_id = "org.keepassxc.KeePassXC"; }
          {
            class = "firefox";
            title = "Picture-in-Picture";
          }
        ];
      };
      modifier = "Mod4";
      keybindings = import ./keybindings.nix {
        inherit pkgs config;
        mod = config.wayland.windowManager.sway.config.modifier;
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
      colors = import ./colors.nix { inherit (config) colorscheme; };
      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
    };
    extraConfig = ''
      exec systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec ${pkgs.fnott}/bin/fnott
      exec ${pkgs.swayidle}/bin/swayidle -w \
        timeout 300 '${pkgs.swaylock}/bin/swaylock -f -c 000000' \
        timeout 600 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
        before-sleep '${pkgs.swaylock}/bin/swaylock -f -c 000000' 
      exec ${pkgs.wlsunset}/bin/wlsunset -s 18:00 -S 06:00
      exec ${pkgs.remind}/bin/remind -z -k"${pkgs.libnotify}/bin/notify-send -t 5000 -a 'Remind' 'To-Do' %s" $REMINDERS
    '';
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland

      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    '';
  };
}
