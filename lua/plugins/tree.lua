local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    tag = "nightly",
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" }
    }
}

function M.config()
    require("nvim-tree").setup({
        reload_on_bufenter = true,
        update_focused_file = {
            enable = true,
        },
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = "|",
                    edge = "|",
                    item = "|",
                    bottom = "|",
                    none = " ",
                },
            },
        },
        diagnostics = {
            enable = true
        },
        git = {
            ignore = false
        }
    })
end

return M
