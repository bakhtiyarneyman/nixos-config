{ buildVscodeMarketplaceExtension, lib, ... }:

buildVscodeMarketplaceExtension {
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
}
