local M = {
    "williamboman/mason.nvim",
    event = "BufEnter"
}

function M.config()
    require("mason").setup({})
end

return M
