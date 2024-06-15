require("noice").setup({
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d fewer lines' },
            { find = '%d more lines' },
          },
        }
      },
      {
        filter = {
          event = 'lsp',
          kind = 'progress',
        },
        opts = { skip = true },
      },
    },
})

require("notify").setup({
    background_colour = "#000000",
    enabled = false,
})
