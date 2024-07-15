local M = {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = "float"
  },
  keys = {
    { '<leader>tt', ':ToggleTerm<CR>',                      { desc = 'Toggle terminal' } },
    { '<leader>tf', ':ToggleTerm direction=float<CR>',      { desc = 'Toggle terminal float' } },
    { '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle terminal horizontal' } },
  }
}

return M
