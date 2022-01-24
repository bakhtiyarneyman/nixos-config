{ pkgs, config, nix-colors, ... }:

let
  wallpaper = (nix-colors.lib { inherit pkgs; }).nixWallpaperFromScheme {
    scheme = config.colorscheme;
    width = 1920;
    height = 1080;
    logoScale = 4.0;
  };
in
''
  riverctl spawn "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
  riverctl spawn "${pkgs.fnott}/bin/fnott"
  riverctl spawn "${config.programs.waybar.package}/bin/waybar"
  riverctl spawn "${pkgs.swaybg}/bin/swaybg -i ${wallpaper} -m fill"
  riverctl spawn "${pkgs.wlsunset}/bin/wlsunset -s 18:00 -S 06:00"
  riverctl spawn "[ -z \"$(pgrep remind)\" ] && ${pkgs.remind}/bin/remind -z \"-k${pkgs.libnotify}/bin/notify-send -t 5000 -a 'Remind' 'To-Do' %s\" $REMINDERS"
''
