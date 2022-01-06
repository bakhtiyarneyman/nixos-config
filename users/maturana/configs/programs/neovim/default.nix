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

      nix.enable = true;
    };
    extraConfigLua = import ./configs/init.nix { inherit pkgs; };
    extraPlugins = import ./extra-plugins.nix {
      inherit (pkgs) vimPlugins;
    };
  };
}