{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    userSettings = {
      # font configuration
      editor.fontFamily = "'Cascadia Code', 'Noto Color Emoji', 'CaskaydiaCove Nerd Font'";
      editor.fontLigatures = true;
      editor.fontSize = 14;

      keyboard.dispatch = "keyCode";

      # disable startup page
      workbench.startupEditor = "none";

      # disable menu bar
      window.menuBarVisibility = "hidden";

      # disable scrollbars
      editor.scrollbar.horizontal = "hidden";
      editor.scrollbar.vertical = "hidden";

      # set theme and icon theme
      workbench.iconTheme = "material-icon-theme";
      workbench.colorTheme = "Gruvbox Dark Medium";

      # markdown config
      "[markdown]" = {
        editor.defaultFormatter = "yzhang.markdown-all-in-one";
      };

      # web development formatting
      "[html]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
        editor.tabSize = 2;
      };
      "[css]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
        editor.tabSize = 2;
      };
      "[javascript]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
        editor.tabSize = 2;
      };
      "[php]" = {
        editor.tabSize = 2;
      };

      "[nix]" = {
        editor.tabSize = 2;
      };

      # python extension
      python = {
        languageServer = "Pylance";

        formatting = {
          blackPath = "${pkgs.python3Packages.black}/bin/black";
          provider = "black";
          blackArgs = [ "-l" "80" "-S" ];
        };
        linting = {
          flake8Enabled = true;
          flake8Path = "${pkgs.python3Packages.flake8}/bin/flake8";
          flake8Args = [ "--stdin-display-name" "\${INPUT}" ];

          mypyEnabled = true;
          mypyPath = "${pkgs.python3Packages.mypy}/bin/mypy";
          mypyArgs = [ "--show-column-numbers" ];
        };
      };
    };

    extensions = import ./extensions.nix {
      inherit (pkgs) vscode-extensions vscode-utils;
    };
  };
}
