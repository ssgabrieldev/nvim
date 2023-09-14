local M = {
  'mfussenegger/nvim-dap',
  keys = {
    { '<leader>db', ':DapToggleBreakpoint<cr>', { desc = 'Toggle breakpoint' } },
    { '<leader>dc', ':DapContinue<cr>', { desc = 'Debugger continue' } },
    { '<leader>de', ':DapTerminate<cr>', { desc = 'Debugger continue' } },
    { '<leader>dr', ':DapToggleRepl<cr>', { desc = 'Toggle repl' } },
  },
  config = function()
    local dap = require('dap')

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
      },
      {
        name = 'Node Attach to Process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
      },
    }
  end
}

return M
