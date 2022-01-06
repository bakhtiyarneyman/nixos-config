{ buildVscodeMarketplaceExtension, lib, ... }:

buildVscodeMarketplaceExtension {
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
}
