--uncomment for melange theme
--vim.opt.termguicolors = true
--vim.cmd.colorscheme 'melange'

-- for catppuccin:
require("catppuccin").setup({
    flavour = "frappe", -- "mocha", "macchiato", "latte"
    integrations = {
       treesitter = false,
       mason = false
   }
})

function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme("catppuccin")

--    local highlights = vim.api.nvim_get_hl(0, {})
--    for name, _ in pairs(highlights) do
--        vim.api.nvim_set_hl(0, name, { bg = "none"})
--    end
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"})
    vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "none"})
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {fg = "Red", bg = "none"})
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {fg = "orange",bg = "none"})
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {fg = "lightgreen",bg = "none"})
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {fg = "cyan",bg = "none"})
end
-- uncomment for tokyonight theme
-- vim.cmd[[colorscheme tokyonight]]
ColorMyPencils()
