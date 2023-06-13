local M = {
  {
    "NvChad/nvterm",
    enabled = false
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        shade_terminal = false,
        direction = "float"
      })
    end,
    lazy = false
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = false,
            padding = 1
          },
        },
        diagnostics = "nvim_lsp",
        indicator = {
          style = "none",
        },
      },
    },
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local border = "single"
          local handlers = {
            ["textDocument/hover"] = vim.lsp.with(
              vim.lsp.handlers.hover,
              { border = border, max_width = 80, max_height = 40 }
            ),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
          }
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

          capabilities.textDocument.completion.completionItem.snippetSupport = true
          vim.diagnostic.config {
            float = {
              border = border,
            },
          }

          for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
          end

          require("lspconfig.ui.windows").default_options = {
            border = border,
          }

          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            handlers = handlers,
            single_file_support = true
          }
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require("plugins.configs.cmp")
      local cmp = require("cmp")
      local border = "single"

      opts.window = {
        completion = cmp.config.window.bordered({ border = border }),
        documentation = cmp.config.window.bordered({ border = border }),
      }

      return opts
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      char = "|"
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/js-debug-adapter"),
          args = {
            "${port}"
          },
        }
      }
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25
              },
              {
                id = "breakpoints",
                size = 0.25
              },
              {
                id = "stacks",
                size = 0.25
              },
              {
                id = "watches",
                size = 0.25
              }
            },
            position = "left",
            size = 40
          },
          {
            elements = {
              {
                id = "repl",
                size = 1
              }
            },
            position = "bottom",
            size = 10
          }
        }
      })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
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
        icons = {
          show = {
            git = true
          }
        }
      },
      diagnostics = {
        enable = true
      },
      git = {
        enable = true,
        ignore = false,
      }
    }
  },
  lazy = false
}

return M
