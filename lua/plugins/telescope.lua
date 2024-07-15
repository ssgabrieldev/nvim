local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find file" },
    { "<leader>fw", "<CMD>Telescope live_grep<CR>",  desc = "Find pattern" },
    { "<leader>fb", "<CMD>Telescope buffers<CR>",    desc = "Find buffer" },
    { "<leader>fg", "<CMD>Telescope git_status<CR>", desc = "Find git change" },
    { "<leader>fk", "<CMD>Telescope keymaps<CR>",    desc = "Find keymap" },
  }
}

function M.config()
  require("telescope").setup({})
end

return M
