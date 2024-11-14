--uncomment for melange theme
--vim.opt.termguicolors = true
--vim.cmd.colorscheme 'melange'

-- for catppuccin:
-- require("catppuccin").setup({
--     flavour = "frappe", -- "mocha", "macchiato", "latte"
--     integrations = {
--        treesitter = false,
--        mason = false,
--        nvimtree = {
-- 		enabled = false,
-- 		show_root = false,
-- 		transparent_panel = false,
-- 	},
--    }
-- })
require('rose-pine').setup({
    highlight_groups = {
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "base" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
    },
    disabled_background = true
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

--    local highlights = vim.api.nvim_get_hl(0, {})
--    for name, _ in pairs(highlights) do
--        vim.api.nvim_set_hl(0, name, { bg = "none"})
--    end
    -- transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"})
    -- vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "none"})
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {fg = "Red", bg = "none"})
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {fg = "orange",bg = "none"})
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {fg = "lightgreen",bg = "none"})
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {fg = "cyan",bg = "none"})
end
-- uncomment for tokyonight theme
-- vim.cmd[[colorscheme tokyonight]]
ColorMyPencils()
