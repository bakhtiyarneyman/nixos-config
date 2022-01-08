''
  local map = vim.api.nvim_set_keymap
  vim.g.mapleader = ' '

  map('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true }) 

  -- telescope
  map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
''
