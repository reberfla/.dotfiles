return {
    'stevearc/oil.nvim',
    opts = {
        columns = {"permissions", "icon" },
        view_options = {
            show_hidden = true,
        }
    },
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
    lazy = false,
}
