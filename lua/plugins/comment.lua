local M = {
    "terrortylor/nvim-comment",
    keys = {
        { "<leader>/", ":CommentToggle<cr>", desc = "Pick buffer" },
        { "<leader>/", ":CommentToggle<cr>", mode = 'v', { desc = "Pick buffer" } },
    },
    config = function()
      require('nvim_comment').setup()
    end
}

return M

