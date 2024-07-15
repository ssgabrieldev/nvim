local M = {
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require("onedark").setup({
      style = "darker",
      transparent = false
    })

    require('onedark').load()
  end,
}

return M
