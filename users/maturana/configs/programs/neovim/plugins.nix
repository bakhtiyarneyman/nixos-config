{
  bufferline.enable = true;
  lualine.enable = true;
  goyo.enable = true;
  nvim-tree.enable = true;
  telescope = {
    enable = true;
  };
  dashboard = let logos = import ./logos.nix; in {
    enable = true;
    header = logos.kurumi-chan;
  };
  nix.enable = true;
  zig.enable = true;
  treesitter.enable = true;
  lsp = {
    enable = true;
    servers.pyright.enable = true;
    servers.rnix-lsp.enable = true;
    servers.rust-analyzer.enable = true;
  };
  neogit.enable = true;
}
