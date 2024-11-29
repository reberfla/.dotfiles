local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.get_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.get_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup({})
require('lspconfig').pylsp.setup {
  on_attach = lsp.on_attach,
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        pycodestyle = { enabled = false }
      },
    },
  },
}
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'cssls', 'svelte', 'dockerls', 'docker_compose_language_service' },
  handlers = {
    lsp.default_setup,
  }
})

lspconfig.svelte.setup({
  filetypes = { 'typescript', 'javascript', 'svelte', 'html', 'css' },
})

lspconfig.kotlin_language_server.setup({
 cmd = {'kotlin-language-server'},
 filetypes = { 'kotlin'},
})

lsp.set_sign_icons({
  error = 'E',
  warn = 'W',
  hint = 'H',
  info = 'I'
})

lsp.setup()
