local M = {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  keys = {
    { '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Toggle terminal float' } },
    { '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle terminal horizontal' } },
  }
}

return M
