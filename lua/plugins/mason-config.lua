local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig"
  },
  lazy = false
}

function M.config()
  require("mason-lspconfig").setup({})
  require("mason-lspconfig").setup_handlers({
    ["jdtls"] = function()
    end,
    function(server_name)
      local utils_lsp = require('plugins.utils.lsp')

      require("lspconfig")[server_name].setup({
        on_attach = utils_lsp.on_attach,
        capabilities = utils_lsp.capabilities,
        handlers = utils_lsp.handlers,
      })
    end
  })
end

return M
