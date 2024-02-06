local M = {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  keys = {
    { '<c-j>', ':ToggleTerm<cr>', { desc = 'Toggle terminal' } },
    { '<c-j>', '<cmd>ToggleTerm<cr>', mode = 't', { desc = 'Toggle terminal' } },
  }
}

return M
