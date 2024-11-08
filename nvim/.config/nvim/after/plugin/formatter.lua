require'formatter'.setup{
  loggin = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    json = {
      require('formatter.filetypes.json').jq
    },
    rust = {
      require('formatter.filetypes.rust').rustfmt
	},
    svelte = {
      require('formatter.filetypes.svelte')
    },
    kotlin = {
      require('formatter.filetypes.kotlin').ktlint
    },
    python = {
      require('formatter.filetypes.python').black,
      require('formatter.filetypes.python').isort
    },
  }
}
