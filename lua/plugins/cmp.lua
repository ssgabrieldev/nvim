local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-buffer",
  },
  event = "InsertEnter"
}

function M.config()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local border = vim.g.border_style

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered({ border = border }),
      documentation = cmp.config.window.bordered({ border = border }),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-n>"] = cmp.mapping(function()
        cmp.select_next_item()
      end),
      ["<C-p>"] = cmp.mapping(function()
        cmp.select_prev_item()
      end),
    }),
    formatting = {
      format = lspkind.cmp_format(),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" }
    }, {
      { name = "buffer" },
    }),
  })
end

return M
