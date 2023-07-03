local M = {
  ui = {
    theme = "kanagawa",
    hl_add = {
      CursorLine = { bg = "#282a2e" }
    },
    tabufline = {
      enabled = false
    },
    nvdash = {
      load_on_startup = false,
      header = {
        [[     ⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[     ⠀⠀⣸⢏⢙⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢴⠟⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[     ⠀⠀⡏⠉⠑⢄⠈⠳⣄⠀⢀⣀⣀⢀⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[     ⠀⣶⣧⣤⠄⠀⠉⠢⡈⠋⠁⠀⠀⠉⠓⠦⣄⡀⣦⣀⡠⠤⣄⠀⠀⠀⠀⠀     ]],
        [[     ⠈⣟⢯⣇⠁⠀⠀⠀⠈⢶⣆⠀⠀⠀⠀⠀⣴⠽⠚⣉⣠⠇⣾⠀⠀⠀⠀⠀     ]],
        [[     ⠀⠙⣆⠹⠀⠀⠀⠀⠀⠈⠙⠓⠀⠀⠀⠀⠠⠔⠋⣡⠋⢘⡏⠀⠀⠀⠀⠀     ]],
        [[     ⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠴⠋⠀⢀⢾⡀⠀⠀⠀⠀⠀     ]],
        [[     ⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠋⢀⣼⣋⠀⠀⠀⠀     ]],
        [[     ⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀⢀⢰⣇⠀⠀⠀⣺⠆⠀⠀⠀⠀⠙⠢⣄⠀     ]],
        [[     ⠀⠀⠀⠀⠀⢸⢠⠀⢀⠀⠰⡄⠀⡷⡇⠀⠀⠉⠁⠀⠀⠀⠀⢐⠚⠻⣍⠀     ]],
        [[     ⠀⠀⠀⠀⠀⠾⠛⡦⡿⡷⢷⡟⠢⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛⠂     ]],
        [[     ⠀⠀⠀⠀⠀⠀⠀⢷⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[     ⠀⠀⠀⠀⠀⠀⠀⢸⣶⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
      }
    }
  },
  plugins = "custom.plugins",
  mappings = {
    disabled = {
      n = {
        ["<A-h>"] = "",
        ["<leader>b"] = "",
        ["<C-j>"] = "",
        ["<C-k>"] = "",
        ["<C-l>"] = "",
        ["<C-h>"] = ""
      },
      t = {
        ["<A-h>"] = "",
      }
    },
    global = {
      n = {
        ["<esc>"] = { "<CMD>nohl<cr>" },
        ["<a-s>"] = { "<CMD>e ~/.config/nvim/<CR>", "Open settings" },
        ["<a-h>"] = { "<CMD>vertical resize -1<CR>", "Resize vertical -1" },
        ["<a-j>"] = { "<CMD>resize -1<CR>", "Resize horizontal -1" },
        ["<a-k>"] = { "<CMD>resize +1<CR>", "Resize horizontal +1" },
        ["<a-l>"] = { "<CMD>vertical resize +1<CR>", "Resize vertical +1" }
      }
    },
    toggleterm = {
      n = {
        ["<c-j>"] = {
          function()
            vim.cmd("exe v:count . \" ToggleTerm\"")
          end
        }
      },
      t = {
        ["<c-j>"] = {
          function()
            vim.cmd("exe v:count . \" ToggleTerm\"")
          end
        }
      }
    },
    buferline = {
      n = {
        ["<tab>"] = {
          function()
            vim.cmd("BufferLineCycleNext")
          end,
          "Next buffer"
        },
        ["<s-tab>"] = {
          function()
            vim.cmd("BufferLineCyclePrev")
          end,
          "Prev buffer"
        },
        ["<leader>x"] = {
          function()
            vim.cmd("BufferLinePickClose")
          end,
          "Pick close buffer"
        },
      }
    },
    lsp = {
      n = {
        ["<leader>le"] = {
          function()
            vim.diagnostic.open_float()
          end,
          "LSP list erros",
        },
        ["<leader>gd"] = {
          function()
            vim.lsp.buf.definition()
          end,
          "Goto definition",
        },
        ["<leader>gh"] = {
          function()
            vim.lsp.buf.hover()
          end,
          "LSP hover",
        },
        ["<leader>ca"] = {
          function()
            vim.lsp.buf.code_action()
          end,
          "LSP code action",
        },
        ["<leader>rn"] = {
          function()
            require("nvchad_ui.renamer").open()
          end,
          "LSP rename",
        },
        ["<leader>fm"] = {
          function()
            vim.lsp.buf.format({ async = true })
          end,
          "LSP format"
        },
      }
    },
    dap = {
      n = {
        ["<leader>dc"] = {
          function()
            require('dap.ext.vscode').load_launchjs(
              ".debug/launch.json",
              {
                ["pwa-chrome"] = {
                  "javascript",
                  "javascriptreact",
                  "typescript",
                  "typescriptreact"
                },
                ["pwa-node"] = {
                  "javascript",
                  "typescript"
                },
              }
            )

            vim.cmd("DapContinue")
          end,
          "Init/Resume debugger"
        },
        ["<leader>db"] = {
          function()
            vim.cmd("DapToggleBreakpoint")
          end,
          "Toggle breakpoint"
        },
        ["<leader>dr"] = {
          function()
            vim.cmd("DapToggleRepl")
          end,
          "Show dap repl"
        },
        ["<leader>dl"] = {
          function()
            vim.cmd("DapShowLog")
          end,
          "Show dap logs"
        }
      }
    }
  }
}

return M
