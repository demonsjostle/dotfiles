local status_dap, dap = pcall(require, "dap")
local status_dapui, dapui = pcall(require, "dapui")
if (not status_dap) then return end
if (not status_dapui) then return end

dapui.setup()
require("dap-python").setup("python")

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end


-- Keymaps
vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dc', dap.continue, { noremap = true, silent = true })
