local M = {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = "float",
    float_opts = {
      title_pos = "center",
      winblend = 3
    },
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end
    }
  },
  keys = {
    { '<leader>tt', ':ToggleTerm<CR>',                      { desc = 'Toggle terminal' } },
    { '<leader>tf', ':ToggleTerm direction=float<CR>',      { desc = 'Toggle terminal float' } },
    { '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle terminal horizontal' } },
  }
}

return M
