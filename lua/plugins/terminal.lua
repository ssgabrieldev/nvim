local M = {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = 'float'
  },
  keys = {
    { '<c-t>', ':ToggleTerm<cr>', { desc = 'Toggle terminal' } },
    { '<c-t>', '<cmd>ToggleTerm<cr>', mode = 't', { desc = 'Toggle terminal' } },
  }
}

return M
