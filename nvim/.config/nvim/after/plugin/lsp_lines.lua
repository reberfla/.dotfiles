local lines = require("lsp_lines")

vim.keymap.set(
  "",
  "<Leader>l",
  lines.toggle,
  { desc = "Toggle lsp_lines" }
)
