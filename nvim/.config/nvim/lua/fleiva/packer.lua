vim.cmd [[packadd packer.nvim]]
vim.o.termguicolors = true

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- visual stuff

  -- theme
  use('catppuccin/nvim', {as = 'catppuccin'})
  -- expand lsp messages
  use{
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- bottom line of neovim
  use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
          require("lsp_lines").setup()
      end,
  })
  -- visuals of cmd line + notifications
  use{
      "folke/noice.nvim",
      requires = { {
	  "MunifTanjim/nui.nvim",
	  "rcarriga/nvim-notify",
      } }
  }


  -- functional stuff

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- harpoon ofc!
  use{
      'theprimeagen/harpoon',
      branch = 'harpoon2',
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  -- history of files
  use('mbbill/undotree')
  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  -- markdown preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- file tree
  use{
    'nvim-tree/nvim-tree.lua',
    requires ={
        'nvim-tree/nvim-web-devicons',
        },
    }
  -- comment marked lines
  use('numToStr/Comment.nvim')
  -- automatic closing brackets
  use('windwp/nvim-autopairs')
  -- automatic indenting
  use('tpope/vim-sleuth')
  -- locate errors/warnings etc.
  use{
    "folke/trouble.nvim",
    requires = { {"nvim-tree/nvim-web-devicons"} },
  }
end)

