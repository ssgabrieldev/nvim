local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = 'mocha'
    })

    vim.cmd.colorscheme "catppuccin"
  end
}

return M
