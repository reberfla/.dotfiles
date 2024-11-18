require("oil").setup({
    columns = { "icon" },
    view_options = {
        show_hidden = true,
    },
})
vim.keymap.set("n", "<leader>t", "<CMD>Oil<CR>")
