local M = {
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require("onedark").setup({
      style             = "darker",
      toggle_style_list = { 'darker', 'deep', 'cool', 'warmer', 'dark', 'warm' },
      toggle_style_key  = '<leader>ts',
      term_colors       = true,
      ending_tildes     = true,
      transparent       = true,
      diagnostics       = {
        darker = true,
        undercurl = true,
        background = true,
      },
    })

    require('onedark').load()
  end,
}

return M
