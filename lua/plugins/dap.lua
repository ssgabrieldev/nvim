local M = {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  keys = {
    { '<leader>db', ':DapToggleBreakpoint<cr>', { desc = 'Toggle breakpoint' } },
    { '<leader>dt', ':DapTerminate<cr>',        { desc = 'Debugger terminate' } },
    { '<leader>dc', ':DapContinue<cr>',         { desc = 'Debugger continue' } },
    {
      '<leader>dl',
      function()
        require('dap.ext.vscode').load_launchjs(
          nil,
          {
            ["node"] = { 'javascript' }
          }
        )
      end,
      { desc = 'Toggle ui' }
    },
    {
      '<leader>dou',
      function()
        require('dapui').toggle({ reset = true })
      end,
      { desc = 'Toggle ui' }
    },
    {
      '<leader>dor',
      function()
        require('dapui').float_element("repl", { enter = true })
      end,
      { desc = 'Toggle repl' }
    },
    {
      '<leader>dob',
      function()
        require('dapui').float_element("breakpoints", { enter = true })
      end,
      { desc = 'Toggle repl' }
    },
    {
      '<leader>dow',
      function()
        require('dapui').float_element("watches", { enter = true })
      end,
      { desc = 'Toggle repl' }
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.adapters.node = {
      type = 'executable',
      command = vim.fn.stdpath('data') .. '/mason/bin/node-debug2-adapter',
    }

    dap.configurations["javascript"] = {
      {
        name = 'Node Launch',
        type = 'node',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
      }
    }

    dapui.setup()
  end
}

return M
