{ vimPlugins, ... }:

with vimPlugins; [
  julia-vim
  nvim-tree-lua
  dashboard-nvim
  emmet-vim

  # cmp
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp_luasnip
  luasnip

  coc-nvim
  coc-emmet
  coc-tsserver
]
