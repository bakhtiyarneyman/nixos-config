{ colorscheme, ... }:

with colorscheme.colors; ''
  * {
    border: none;
    border-radius: 0;
    font-family: 'Cascadia Code', 'CaskaydiaCove Nerd Font';
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

  /* workspaces */
  #workspaces button {
    padding: 0 0.4rem;
    background: transparent;
    color: #${base06};
  }

  #workspaces button:hover {
    background: #${base02};
    box-shadow: inset 0 -3px #${base0B};
  }

  #workspaces button.focused {
    box-shadow: inset 0 -3px #${base0B};
  }

  #workspaces button.urgent {
    background: #${base08};
  }

  #mode {
    margin-left: 2rem;
    margin-right: 2rem;
  }

  #tray,
  #custom-pkgs,
  #custom-bluetooth,
  #network,
  #pulseaudio,
  #backlight,
  #battery,
  #language,
  #clock {
    background: #${base04};
    padding: 2px 10px;
    margin: 6px 3px;
    color: #${base00};
    border-radius: 4px;
  }

  #window,
  #workspaces {
    margin: 0 4px;
  }

  .modules-left > widget:first-child > #workspaces {
    margin-left: 0;
  }
  .modules-right > widget:first-child > #workspaces {
    margin-right: 0;
  }
''