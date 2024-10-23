vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- keymaps in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "z", "y")
vim.keymap.set("n", "Z", "Y")
vim.keymap.set("n", "<leader>z", "\"+z")
vim.keymap.set("n", "<leader>Z", "\"+Z")
vim.keymap.set("n", "E", "$", {noremap=false})

--replac KeyMap
vim.keymap.set("n", "gr", "gd[{V%::s/<C-R>///gc<left><left><left>")
vim.keymap.set("n", "gR", "gD[{V%::s/<C-R>///gc<left><left><left>")

-- keymaps in insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- keymaps in visual mode
vim.keymap.set("v", "oo", "<Esc>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "z", "y")
vim.keymap.set("v", "<leader>z", "\"+z")
vim.keymap.set("v", "<leader>Z", "\"+Z")

-- special keymaps
vim.keymap.set("x", "<leader>p", "\"_dP")
-- faster window close
vim.keymap.set("n", "<leader>qq", ":q<CR>",
  {silent = true, noremap = true}
)
-- Noice
vim.keymap.set("n", "<leader>nn", "<cmd>Noice dismiss<cr>", {noremap=true})
