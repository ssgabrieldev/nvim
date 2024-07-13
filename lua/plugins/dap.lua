local M = {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  keys = {
    { '<leader>db', ':DapToggleBreakpoint<cr>', { desc = 'Toggle breakpoint' } },
    { '<leader>dc', ':DapContinue<cr>',         { desc = 'Debugger continue' } },
    { '<leader>de', ':DapTerminate<cr>',        { desc = 'Debugger continue' } },
    { '<leader>dr', ':DapToggleRepl<cr>',       { desc = 'Toggle repl' } },
    {
      '<leader>du',
      function()
        require('dapui').toggle({ reset = true })
      end,
      { desc = 'Toggle ui' }
    },
    {
      '<leader>df',
      function()
        require('dapui').float_element(nil, { enter = true })
      end,
      { desc = 'Toggle ui' }
    },
    {
      '<leader>dl',
      function()
        require('dap.ext.vscode').load_launchjs(
          nil,
          {
            ["node"] = {'javascript'}
          }
        )
      end,
      { desc = 'Toggle ui' }
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
