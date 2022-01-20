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
    globals = {
      mapleader = " ";
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
