{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;
    colorschemes.gruvbox.enable = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
<<<<<<< HEAD
    colorschemes.gruvbox.enable = true;
    plugins = {
      bufferline.enable = true;
      lualine.enable = true;
      nvim-tree = {
        enable = true;
        view = {
          side = "left";
          autoResize = true;
        };
        updateCwd = true;
        diagnostics.enable = true;
      };

      goyo.enable = true;

      telescope.enable = true;

      nix.enable = true;
      zig.enable = true;
      treesitter = {
        enable = true;
        indent = true;
        ensureInstalled = "all";
      };

      lsp = {
        enable = true;
        servers.pyright.enable = true;
        servers.rnix-lsp.enable = true;
        servers.zls.enable = true;
      };
=======
    globals = {
      mapleader = " ";
>>>>>>> 9f654c7 (flake: use my nixvim fork)
    };
    maps = import ./maps.nix;
    plugins = import ./plugins.nix;
    extraPlugins = import ./extra-plugins.nix {
      inherit (pkgs) vimPlugins;
    };
    extraPackages = with pkgs; [
      nodejs
      nodePackages.pyright
    ];
  };
}
