{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    colorschemes.gruvbox.enable = true;
    plugins = {
      bufferline.enable = true;
      lualine.enable = true;

      goyo.enable = true;

      telescope.enable = true;

      nix.enable = true;
      zig.enable = true;

      lsp = {
        enable = true;
        servers.pyright.enable = true;
        servers.rnix-lsp.enable = true;
      };
    };
    extraConfigLua = import ./configs/init.nix { inherit pkgs; };
    extraPlugins = import ./extra-plugins.nix {
      inherit (pkgs) vimPlugins;
    };
    extraPackages = with pkgs; [
      rnix-lsp
      nodejs
      nodePackages.pyright
    ];
  };
}
