return {
  'stevearc/oil.nvim',
  opts = {
  columns = {"icon"},
  view_optons = {
    show_hidden = true,
}},
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
