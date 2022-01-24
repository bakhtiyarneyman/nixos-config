{ config, ... }:

with config.colorscheme.colors; ''
  * {
    border: none;
    border-radius: 0;
    font-family: '${config.gtk.font.name}', 'CaskaydiaCove Nerd Font';
    font-size: 15px;
    min-height: 0;
  }

  /* waybar */
  window#waybar {
    background: #${base00};
    color: #${base06};
  }

  window#waybar.hidden {
    opacity: 0.2;
  }

  /* tags */
  #tags button {
    margin: 0 0.2rem;
    background: transparent;
    color: #${base01};
  }

  #tags button.occupied {
    color: #${base05}
  }

  #tags button.focused {
    color: #${base0B};
  }

  #tags button.urgent {
    background: #${base08};
  }

  #tray,
  #custom-pkgs,
  #custom-bluetooth,
  #network,
  #pulseaudio,
  #backlight,
  #battery,
  #mpd,
  #clock {
    background: #${base04};
    padding: 2px 10px;
    margin: 6px 3px;
    color: #${base00};
    border-radius: 4px;
  }

  #window,
  #tags {
    margin: 0 4px;
  }

  .modules-left > widget:first-child > #tags {
    margin-left: 0;
  }
  .modules-right > widget:first-child > #tags {
    margin-right: 0;
  }
''
