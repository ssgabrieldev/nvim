local M = {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    dap.adapters.firefox = {
      type = 'executable',
      command = vim.fn.stdpath("data") .. '/mason/bin/firefox-debug-adapter',
    }

    require('dap.ext.vscode').load_launchjs()

    dap.configurations.javascript = {
      {  
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = '/usr/bin/firefox'
      }
    }
  end
}

return M
