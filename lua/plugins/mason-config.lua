local M = {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig"
  },
}

function M.config()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua-language-server",
      "node-debug2-adapter",
      "typescript-language-server",
    }
  })
  require("mason-lspconfig").setup_handlers({
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
