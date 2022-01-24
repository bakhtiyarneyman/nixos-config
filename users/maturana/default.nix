{ pkgs, config, nix-colors, ... }:

{
  imports = [ ./configs ./modules ];
  
  colorscheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  home = {
    username = "maturana";
    homeDirectory = "/home/${config.home.username}";

    sessionVariables = {
      # environment variables
      BROWSER = "${config.programs.firefox.package}/bin/firefox";
      EDITOR = "${config.programs.nixvim.package}/bin/nvim";
      REMINDERS = "${config.home.homeDirectory}/.reminders";

      XKB_DEFAULT_LAYOUT = "us,us";
      XKB_DEFAULT_VARIANT = "colemak,intl";
      XKB_DEFAULT_OPTIONS = "caps:swapescape,grp:alt_shift_toggle";

      # wayland
      XDG_SESSION_TYPE = "wayland";

      # firefox
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_DBUS_REMOTE = 1;
    };

    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

    packages = import ./packages.nix { inherit pkgs; }
      ++ import ./scripts.nix { inherit (pkgs) writeShellScriptBin; };
  };
}
