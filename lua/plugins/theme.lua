local M = {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    require("bluloco").setup({
      style       = "dark",
      transparent = false,
      italics     = false,
      terminal    = vim.fn.has("gui_running") == 1,
      guicursor   = true,
    })

    vim.opt.termguicolors = true
    vim.cmd.colorscheme("bluloco")
  end,
}

return M
