local tree_api = require "nvim-tree"

local config_status_ok, nvim_tree_config = pcall(require,"nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

tree_api.setup({
    view = {
        width = 50,
        side = "right",
        mappings = {
            { key = "l", cb = tree_cb "edit"},
        },
    },
    git = {
        enable = true,
    }
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<C-o>", vim.cmd.NvimToggle)
