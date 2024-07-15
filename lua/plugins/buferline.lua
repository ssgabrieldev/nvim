local M = {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>bp", "<cmd>BufferLinePick<CR>",       desc = "Pick buffer" },
    { "<leader>bc", "<cmd>BufferLinePickClose<CR>",  desc = "Close a buffer" },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<CR>",  desc = "Close all buffer on the left" },
    { "<leader>bl", "<cmd>BufferLineCloseRight<CR>", desc = "Close all buffer on the right" },
    { "<tab>",      "<cmd>BufferLineCycleNext<CR>",  desc = "Next buffer" },
    { "<s-tab>",    "<cmd>BufferLineCyclePrev<CR>",  desc = "Prev buffer" }
  },
  lazy = false
}

function M.config()
  require("bufferline").setup({
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "dapui_watches",
          text = "Debugger",
          text_align = "center",
          separator = true,
        },
      },
      diagnostics = "nvim_lsp",
      indicator = {
        style = "none"
      }
    },
  })
end

return M
