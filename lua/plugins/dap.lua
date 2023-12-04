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
    { '<leader>dr', ':DapUiToggle<cr>', { desc = 'Toggle ui' } },
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
      },
      {
        name = 'Node Attach to Process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

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
