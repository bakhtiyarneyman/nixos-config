{ lib, ... }:

with lib;

''
  -- dashboard {{{
    do
      local g = vim.g

      g.dashboard_custom_header = {${
        concatMapStrings (line: "'${line}',")
          (splitString "\n" (builtins.readFile ./logos/anime_girl.txt))
      }}

      g.dashboard_custom_footer = {
        'Your code is little sus'
      }
    end
  -- }}}

  -- nvim-tree {{{
    do
      local nvim_tree = require('nvim-tree')

      nvim_tree.setup()
    end
  -- }}}

  -- cmp {{{
    do
      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable,
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' }
        }
      }
    end
  -- }}}
''
