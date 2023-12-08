local M = {}

local border = vim.g.border_style
local opts = { noremap = true, silent = true }

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = border, max_width = 80, max_height = 40 }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = border }
  ),
}

M.capabilities = vim.lsp.protocol.make_client_capabilities({})

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.diagnostic.config({
  float = {
    border = border
  }
})

require("lspconfig.ui.windows").default_options = {
  border = border
}

M.on_attach = function(_, bufnr)
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
  vim.keymap.set(
    "n",
    "<LEADER>rn",
    vim.lsp.buf.rename,
    bufopts
  )
  vim.keymap.set(
    "n",
    "<LEADER>ca",
    vim.lsp.buf.code_action,
    opts
  )
  vim.keymap.set(
    "n",
    "<LEADER>le",
    vim.diagnostic.open_float,
    opts
  )
end

return M
