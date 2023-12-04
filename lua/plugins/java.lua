local M = {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    'rcarriga/nvim-dap-ui',
    "mfussenegger/nvim-dap",
    "neovim/nvim-lspconfig",
  },
  ft = "java",
  keys = {
    { "<leader>jv", function() require('jdtls.dap').setup_dap_main_class_configs() end, { desc = "Update jdtls debug configurations" } }
  },
  config = function()
    local jdtls = require('jdtls')
    local config = {
      cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
      init_options = {
        bundles = {
          vim.fn.glob(
          vim.fn.stdpath('data') ..
          '/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1)
        },
      }
    }

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
    local capabilities = vim.lsp.protocol.make_client_capabilities({})

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    vim.diagnostic.config({
      float = {
        border = border
      }
    })

    require("lspconfig.ui.windows").default_options = {
      border = border
    }

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
      vim.keymap.set(
        "n",
        "<LEADER>rn",
        vim.lsp.buf.rename,
        bufopts
      )
      vim.keymap.set(
        "n",
        "<LEADER>le",
        vim.diagnostic.open_float,
        opts
      )
    end

    config.on_attach = on_attach
    config.handlers = handlers

    jdtls.start_or_attach(config)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.setup").add_commands()
  end
}

return M
