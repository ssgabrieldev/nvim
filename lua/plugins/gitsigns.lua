local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  keys = {
    { '<leader>dt', ':Gitsigns diffthis<CR>', desc = 'Git diff this' }
  },
  config = function()
    require('gitsigns').setup({
      current_line_blame = true
    })
  end
}

return M
