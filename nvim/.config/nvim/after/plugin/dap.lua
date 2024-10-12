require('dapui').setup()

require('nvim-dap-virtual-text').setup()

local ui = require ('dapui')
local dap = require ('dap')

vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>gb', dap.run_to_cursor)

 --eval value under cursor
vim.keymap.set('n', '<leader>?', function()
    require('dapui').eval(nil,{enter = true})
end)

require('dap-python').setup()
--require('dap-kotlin').setup()

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end

require('neodev').setup({
    library = { plugins = { 'nvim-dap-ui' }, types = true}
})
