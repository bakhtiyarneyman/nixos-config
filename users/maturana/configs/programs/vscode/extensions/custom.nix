{ vscode-utils, lib, ... }:

with vscode-utils;

[
  (buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "emojisense";
      publisher = "bierner";
      version = "0.9.0";
      sha256 = "0gpcpwh57lqlynsrkv3smykndb46xjh7r85lb291wdklq5ahmb2j";
    };

    meta = with lib; {
      description = ''
        Emoji Autocomplete Plugin For VSCode
      '';
      homepage = "https://marketplace.visualstudio.com/items?itemName=bierner.emojisense";
      license = licenses.mit;
      maintainers = [ ];
    };
  })

  (buildVscodeMarketplaceExtension {
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
  })

  (buildVscodeMarketplaceExtension {
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
  })
]