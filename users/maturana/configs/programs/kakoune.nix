{ pkgs
, ...
}:

{
  programs.kakoune = {
    enable = true;

    config = {
      tabStop = 4;
      indentWidth = 4;

      autoInfo = [ "command" ];
      autoComplete = [ "insert" "prompt" ];
      autoReload = "yes";

      ui.statusLine = "bottom";
      ui.assistant = "clippy";
      ui.enableMouse = true;

      showMatching = true;

      numberLines = {
        enable = true;
        relative = true;
        separator = "'  '";
      };

      hooks = [
        {
          name = "WinCreate";
          option = ".*";
          commands = ''
            editorconfig-load
          '';
        }
        {
          name = "WinSetOption";
          option = "filetype=(haskell|rust|zig)";
          commands = ''
            lsp-enable-window
          '';
        }
      ];
    };

    extraConfig = ''
   		# colorscheme
   		colorscheme gruvbox-dark

   		# kak-lsp
    	eval %sh{kak-lsp --kakoune -s $kak_session}
    '';
  };

  # kak-lsp
  home.packages = with pkgs; [
    kak-lsp
  ];

  xdg.configFile."kak-lsp/kak-lsp.toml".text = ''
    [language.haskell]
    filetypes = ["haskell"]
    roots = ["Setup.hs", "stack.yaml", "*.cabal"]
    command = "haskell-language-server-wrapper"
    args = ["--lsp"]

    [language.rust]
    filetypes = ["rust"]
    roots = ["Cargo.toml"]
    command = "rust-analyzer"

    [language.python]
    filetypes = ["python"]
    roots = ["Pipfile"]
    command = "pyright-langserver"
    args = ["--stdio"]

    [language.zig]
    filetypes = ["zig"]
   	roots = ["build.zig"]
   	command = "zls"
  '';
}
