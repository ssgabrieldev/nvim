local M = {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    'rcarriga/nvim-dap-ui',
    "mfussenegger/nvim-dap",
  },
  ft = "java",
  keys = {
    { "<leader>jv", function() require('jdtls.dap').setup_dap_main_class_configs() end, { desc = "Update jdtls debug configurations" } }
  },
  config = function()
    local jdtls = require('jdtls')
    local config = {
      cmd = {vim.fn.stdpath('data') .. '/mason/bin/jdtls'},
      root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1]),
      init_options = {
        bundles = {
          vim.fn.glob(vim.fn.stdpath('data') .. '/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1)
        },
      }
    }

    jdtls.start_or_attach(config)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.setup").add_commands()
  end
}

return M
