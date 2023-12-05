local M = {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  keys = {
    { '<leader>db', ':DapToggleBreakpoint<cr>', { desc = 'Toggle breakpoint' } },
    { '<leader>dc', ':DapContinue<cr>', { desc = 'Debugger continue' } },
    { '<leader>de', ':DapTerminate<cr>', { desc = 'Debugger continue' } },
    { '<leader>dr', ':DapToggleRepl<cr>', { desc = 'Toggle repl' } },
    { '<leader>du', function() require('dapui').toggle({ reset = true }) end, { desc = 'Toggle ui' } },
    { '<leader>df', function() require('dapui').float_element(null, { enter = true }) end, { desc = 'Toggle ui' } },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.adapters.node2 = {
      type = 'executable',
      command = vim.fn.stdpath('data') .. '/mason/bin/node-debug2-adapter',
    }

    dap.configurations.javascript = {
      {  
        name = 'Node Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
      }
    }

    vim.api.nvim_create_user_command(
      'DapUiToggle',
      function()
        dapui.toggle()
      end
      ,
      {}
    )

    dapui.setup()
  end
}

return M
