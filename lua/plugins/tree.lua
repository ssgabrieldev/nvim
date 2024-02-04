local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    tag = "nightly",
    keys = {
        { "<c-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" }
    }
}

function M.config()
    require("nvim-tree").setup({
        diagnostics = {
            enable = true
        },
    })
end

return M
