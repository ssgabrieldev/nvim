local M = {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = 'float'
  },
  keys = {
    { '<leader>t', ':ToggleTerm<cr>', { desc = 'Toggle terminal' } },
  }
}

return M
