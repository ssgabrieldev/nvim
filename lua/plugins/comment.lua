local M = {
    "terrortylor/nvim-comment",
    keys = {
        { "<leader>/", ":CommentToggle<cr>", desc = "Comment line" },
        { "<leader>/", ":CommentToggle<cr>", mode = 'v', { desc = "Comment selected" } },
    },
    config = function()
      require('nvim_comment').setup()
    end
}

return M

