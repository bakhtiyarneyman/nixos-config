{
  bufferline.enable = true;
  lualine.enable = true;
  goyo.enable = true;
  nvim-tree.enable = true;
<<<<<<< HEAD
  telescope = {
    enable = true;
  };
  dashboard = let logos = import ./logos.nix; in {
    enable = true;
    header = logos.kurumi-chan;
  };
  nix.enable = true;
  zig.enable = true;
=======
  dashboard = {
    enable = true;
    header = [
      ""
      ""
      "⣿⣿⣿⣿⣿⣿⣿⣿⢿⠟⢿⣿⣿⣿⣿⠿⠛⠛⠿⢿⣿⣿⣿⣿⠛⣿⢿⣿⣿⣿⣿⣿"
      "⣿⣿⣿⣿⡿⢿⣿⣿⣄⠄⣼⣿⡿⠋⠄⠄⠄⠄⠄⠄⠄⠛⣿⣿⠄⢀⣤⣿⣿⣿⣿⣿"
      "⣿⣿⣿⣷⣤⣸⣿⠛⡛⢛⣿⠋⠄⠄⢀⠄⠄⠄⠄⠄⠄⠄⠘⣿⣿⡿⣿⣿⣿⣿⣿⣿"
      "⣿⣿⣿⣿⣿⡿⠁⠄⠁⠈⠄⠄⠄⠄⣿⡀⠄⠄⠄⠄⠄⠄⠄⠓⠸⠏⠄⢹⣿⣿⣿⣿"
      "⣿⣿⣿⣿⡿⠄⠄⠄⠄⠄⠄⠄⢠⠿⠿⢻⣦⣤⣠⠄⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⣿⣿"
      "⣿⣿⣿⡿⠁⠄⠄⠄⠄⠈⠄⠄⢸⣿⣿⣿⣿⣿⢭⡛⡀⠄⠄⠨⠄⠄⠄⠄⠄⣿⣿⣿"
      "⣿⣿⣿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠻⣧⡀⣈⣿⣿⠟⠄⠄⠠⢇⠄⠄⠄⠄⠄⣿⣿⣿"
      "⣿⣿⡁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⢀⣉⡉⠉⠄⠄⠄⠄⠄⠰⠂⠄⠄⠄⠄⢹⣿⣿"
      "⣿⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⠿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣿⣿"
      "⣿⣿⣿⣶⣤⣤⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⣿⣿"
      ""
      ""
    ];
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
  neogit.enable = true;
=======
>>>>>>> 9f654c7 (flake: use my nixvim fork)
}
