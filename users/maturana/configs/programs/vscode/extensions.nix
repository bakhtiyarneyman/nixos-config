{ vscode-extensions, vscode-utils, lib, ... }:

let
  jdinhlife.gruvbox = vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "gruvbox";
      publisher = "jdinhlife";
      version = "1.5.1";
      sha256 = "0ghB0E+Wa9W2bNFFiH2Q3pUJ9HV5+JfKohX4cRyevC8=";
    };

    meta = with lib; {
      description = ''
        A gruvbox theme including syntax highlighting and workbench & terminal colors.
      '';
      homepage = "https://marketplace.visualstudio.com/items?itemName=jdinhlife.gruvbox";
      license = licenses.mit;
      maintainers = [ ];
    };
  };

  julialang.language-julia = vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "language-julia";
      publisher = "julialang";
      version = "1.5.8";
      sha256 = "0gqjwy5y3y096n53g0jiqkvijdqnwamv028l3lnvx4fbqngv0zyq";
    };

    meta = with lib; {
      description = ''
        Julia extension for Visual Studio Code
      '';
      homepage = "https://www.julia-vscode.org/";
      license = licenses.mit;
      maintainers = [ ];
    };
  };
in with vscode-extensions; [
  # languages support
  jnoortheen.nix-ide
  julialang.language-julia

  # python and data science stuff
  ms-python.python
  ms-python.vscode-pylance
  ms-toolsai.jupyter

  # some useful tools
  esbenp.prettier-vscode
  yzhang.markdown-all-in-one
  donjayamanne.githistory

  # themes
  pkief.material-icon-theme
  jdinhlife.gruvbox
]
