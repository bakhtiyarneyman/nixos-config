{ pkgs, config, nix-colors, ... }:

let
  mod = "Mod4";
  touchpad = "1267:91:Elan_Touchpad";
in
{
  wayland.windowManager.river = {
    enable = true;
    config = pkgs.writeShellScript "init" ''
      #!/usr/bin/env bash

      # input config
      riverctl input "${touchpad}" events enabled
      riverctl input "${touchpad}" tap enabled
      riverctl input "${touchpad}" natural-scroll enabled
      riverctl input "${touchpad}" drag enabled

      # start foot
      riverctl map normal ${mod}+Shift Return spawn ${pkgs.foot}/bin/foot

      # start bemenu
      riverctl map normal ${mod} P spawn "${pkgs.bemenu}/bin/bemenu-run -p ''' \
        --fn '${config.gtk.font.name} 11' \
        --fb '#${config.colorscheme.colors.base00}' --ff '#${config.colorscheme.colors.base06}' \
        --nb '#${config.colorscheme.colors.base00}' --nf '#${config.colorscheme.colors.base06}' \
        --hb '#${config.colorscheme.colors.base04}' --hf '#${config.colorscheme.colors.base01}'"

      # start brave
      riverctl map normal ${mod} F1 spawn ${pkgs.brave}/bin/brave

      # toggle waybar
      riverctl map normal ${mod} B spawn "pkill -USR1 waybar"

      # close the focused view
      riverctl map normal ${mod}+Shift C close

      # exit river
      riverctl map normal ${mod}+Shift Q exit

      # Mod+J and Mod+K to focus the next/previous view in the layout stack
      riverctl map normal ${mod} J focus-view next
      riverctl map normal ${mod} K focus-view previous

      # Mod+Shift+J and Mod+Shift+K to swap the focused view with the next/previous
      # view in the layout stack
      riverctl map normal ${mod}+Shift J swap next
      riverctl map normal ${mod}+Shift K swap previous

      # Mod+Period and Mod+Comma to focus the next/previous output
      riverctl map normal ${mod} Period focus-output next
      riverctl map normal ${mod} Comma focus-output previous

      # Mod+Shift+{Period,Comma} to send the focused view to the next/previous output
      riverctl map normal ${mod}+Shift Period send-to-output next
      riverctl map normal ${mod}+Shift Comma send-to-output previous

      # Mod+Return to bump the focused view to the top of the layout stack
      riverctl map normal ${mod} Return zoom

      # Mod+H and Mod+L to decrease/increase the main ratio of rivertile(1)
      riverctl map normal ${mod} H send-layout-cmd rivertile "main-ratio -0.05"
      riverctl map normal ${mod} L send-layout-cmd rivertile "main-ratio +0.05"

      # Mod+Shift+H and Mod+Shift+L to increment/decrement the main count of rivertile(1)
      riverctl map normal ${mod}+Shift H send-layout-cmd rivertile "main-count +1"
      riverctl map normal ${mod}+Shift L send-layout-cmd rivertile "main-count -1"

      # Mod+Alt+{H,J,K,L} to move views
      riverctl map normal ${mod}+Mod1 H move left 100
      riverctl map normal ${mod}+Mod1 J move down 100
      riverctl map normal ${mod}+Mod1 K move up 100
      riverctl map normal ${mod}+Mod1 L move right 100

      # Mod+Alt+Control+{H,J,K,L} to snap views to screen edges
      riverctl map normal ${mod}+Mod1+Control H snap left
      riverctl map normal ${mod}+Mod1+Control J snap down
      riverctl map normal ${mod}+Mod1+Control K snap up
      riverctl map normal ${mod}+Mod1+Control L snap right

      # Mod+Alt+Shif+{H,J,K,L} to resize views
      riverctl map normal ${mod}+Mod1+Shift H resize horizontal -100
      riverctl map normal ${mod}+Mod1+Shift J resize vertical 100
      riverctl map normal ${mod}+Mod1+Shift K resize vertical -100
      riverctl map normal ${mod}+Mod1+Shift L resize horizontal 100

      # Mod + Left Mouse Button to move views
      riverctl map-pointer normal ${mod} BTN_LEFT move-view

      # Mod + Right Mouse Button to resize views
      riverctl map-pointer normal ${mod} BTN_RIGHT resize-view

      for i in $(seq 1 9); do
          tags=$((1 << ($i - 1)))

          # Mod+[1-9] to focus tag [0-8]
          riverctl map normal ${mod} $i set-focused-tags $tags

          # Mod+Shift+[1-9] to tag focused view with tag [0-8]
          riverctl map normal ${mod}+Shift $i set-view-tags $tags

          # Mod+Ctrl+[1-9] to toggle focus of tag [0-8]
          riverctl map normal ${mod}+Control $i toggle-focused-tags $tags

          # Mod+Shift+Ctrl+[1-9] to toggle tag [0-8] of focused view
          riverctl map normal ${mod}+Shift+Control $i toggle-view-tags $tags
      done

      # Mod+0 to focus all tags
      # Mod+Shift+0 to tag focused view with all tags
      all_tags=$(((1 << 32) - 1))
      riverctl map normal ${mod} 0 set-focused-tags $all_tags
      riverctl map normal ${mod}+Shift 0 set-view-tags $all_tags

      # Mod+Space to toggle float
      riverctl map normal ${mod} Space toggle-float

      # Mod+F to toggle fullscreen
      riverctl map normal ${mod} F toggle-fullscreen

      # Mod+{Up,Right,Down,Left} to change layout orientation
      riverctl map normal ${mod} Up    send-layout-cmd rivertile "main-location top"
      riverctl map normal ${mod} Right send-layout-cmd rivertile "main-location right"
      riverctl map normal ${mod} Down  send-layout-cmd rivertile "main-location bottom"
      riverctl map normal ${mod} Left  send-layout-cmd rivertile "main-location left"

      # Declare a passthrough mode. This mode has only a single mapping to return to
      # normal mode. This makes it useful for testing a nested wayland compositor
      riverctl declare-mode passthrough

      # Mod+F11 to enter passthrough mode
      riverctl map normal ${mod} F11 enter-mode passthrough

      # Mod+F11 to return to normal mode
      riverctl map passthrough ${mod} F11 enter-mode normal

      # Various media key mapping examples for both normal and locked mode which do
      # not have a modifier
      for mode in normal locked; do
          # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
          riverctl map $mode None XF86AudioRaiseVolume  spawn '${pkgs.pamixer}/bin/pamixer -i 5'
          riverctl map $mode None XF86AudioLowerVolume  spawn '${pkgs.pamixer}/bin/pamixer -d 5'
          riverctl map $mode None XF86AudioMute         spawn '${pkgs.pamixer}/bin/pamixer --toggle-mute'

          # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
          riverctl map $mode None XF86AudioMedia spawn '${pkgs.mpc_cli}/bin/mpc toggle'
          riverctl map $mode None XF86AudioPlay  spawn '${pkgs.mpc_cli}/bin/mpc toggle'
          riverctl map $mode None XF86AudioPrev  spawn '${pkgs.mpc_cli}/bin/mpc prev'
          riverctl map $mode None XF86AudioNext  spawn '${pkgs.mpc_cli}/bin/mpc next'

          # Control screen backlight brighness with light (https://github.com/haikarainen/light)
          riverctl map $mode None XF86MonBrightnessUp   spawn '${pkgs.light}/bin/light -A 5'
          riverctl map $mode None XF86MonBrightnessDown spawn '${pkgs.light}/bin/light -U 5'
      done

      # Set background and border color
      riverctl background-color 0x${config.colorscheme.colors.base00}
      riverctl border-color-focused 0x${config.colorscheme.colors.base0B}
      riverctl border-color-unfocused 0x${config.colorscheme.colors.base04}

      # Set keyboard repeat rate
      riverctl set-repeat 50 300

      # Make certain views start floating
      riverctl float-filter-add app-id float
      riverctl float-filter-add title "popup title with spaces"

      # Set app-ids and titles of views which should use client side decorations
      riverctl csd-filter-add app-id "gedit"

      # autostart
      ${import ./autostart.nix { inherit pkgs config nix-colors; }}

      # Set and exec into the default layout generator, rivertile.
      # River will send the process group of the init executable SIGTERM on exit.
      riverctl default-layout rivertile
      exec rivertile -view-padding 6 -outer-padding 6
    '';
  };
}
