--uncomment for melange theme
--vim.opt.termguicolors = true
--vim.cmd.colorscheme 'melange'

-- for catppuccin:
require("catppuccin").setup({
    flavour = "frappe" --, "mocha", "macchiato", "latte"
})

vim.cmd.colorscheme("catppuccin")

-- uncomment for tokyonight theme
-- vim.cmd[[colorscheme tokyonight]]

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
