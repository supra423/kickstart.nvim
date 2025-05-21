return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      {
        'mfussenegger/nvim-dap-python',
        config = function()
          require('dap-python').setup 'python3'
        end,
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start/Continue debugging' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })
    end,
  },
}
