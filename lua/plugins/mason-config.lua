local M = {
  "williamboman/mason-lspconfig.nvim",
  event = "BufEnter"
}

function M.config()
  require("mason-lspconfig").setup()
  require("mason-lspconfig").setup_handlers({
    function(server_name)
      local border = vim.g.border_style
      local opts = { noremap = true, silent = true }
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover,
          { border = border, max_width = 80, max_height = 40 }
        ),
        ["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          { border = border }
        ),
      }
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      capabilities.textDocument.completion.completionItem.snippetSupport = true
      vim.diagnostic.config({
        float = {
          border = border
        }
      })

      require("lspconfig.ui.windows").default_options = {
        border = border
      }

      vim.keymap.set("n", "<LEADER>le", vim.diagnostic.open_float, opts)

      local on_attach = function(_, bufnr)
        local bufopts = {
          noremap = true,
          silent = true,
          buffer = bufnr,
        }
        vim.keymap.set(
          "n",
          "<LEADER>gd",
          vim.lsp.buf.definition,
          bufopts
        )
        vim.keymap.set(
          "n",
          "<LEADER>fm",
          function() vim.lsp.buf.format({ async = true }) end,
          bufopts
        )
        vim.keymap.set(
          "n",
          "<LEADER>gh",
          vim.lsp.buf.hover,
          bufopts
        )
      end

      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      })
    end
  })
end

return M
