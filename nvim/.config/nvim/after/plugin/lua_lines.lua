require('lualine').setup {
  options = {
    icons_enabled = true,
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    theme = 'nord'
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_a = {
      {
        'buffers',
      }
    }
  }
}
