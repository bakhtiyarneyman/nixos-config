{
  bufferline.enable = true;
  lualine.enable = true;
  goyo.enable = true;
  nvim-tree.enable = true;
<<<<<<< HEAD
<<<<<<< HEAD
  telescope = {
    enable = true;
  };
  dashboard = let logos = import ./logos.nix; in {
<<<<<<< HEAD
    enable = true;
    header = logos.kurumi-chan;
  };
  nix.enable = true;
  zig.enable = true;
=======
=======
  telescope = {
    enable = true;
  };
>>>>>>> 4b64f76 (nixvim: add telescope plugin)
  dashboard = {
=======
>>>>>>> f9750e4 (nixvim: add logos to dashboard)
    enable = true;
    header = logos.kurumi-chan;
  };
  nix.enable = true;
>>>>>>> 9f654c7 (flake: use my nixvim fork)
  treesitter.enable = true;
  lsp = {
    enable = true;
    servers.pyright.enable = true;
    servers.rnix-lsp.enable = true;
    servers.rust-analyzer.enable = true;
  };
<<<<<<< HEAD
<<<<<<< HEAD
  neogit.enable = true;
=======
>>>>>>> 9f654c7 (flake: use my nixvim fork)
=======
  neogit.enable = true;
>>>>>>> 1591aea (nixvim: add neogit plugin)
}
