local M = {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      compile = true,
    })

    vim.cmd("color kanagawa-dragon")
  end
}

return M
