{ vimPlugins, ... }:

with vimPlugins; [
  julia-vim

  # cmp
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp_luasnip
  luasnip
]
