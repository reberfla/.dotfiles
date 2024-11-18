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
  -- use('catppuccin/nvim', {as = 'catppuccin'})
    use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
	    vim.cmd('colorscheme rose-pine')
	end
    })
  -- expand lsp messages
  use{
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons'}
  }
  -- bottom line of neovim
  use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
          require("lsp_lines").setup()
      end,
  })
  -- visuals of cmd line + notifications
  -- use{
  --     "folke/noice.nvim",
  --     requires = { {
  --  "MunifTanjim/nui.nvim",
  --  "rcarriga/nvim-notify",
  --     } }
  -- }


  -- functional stuff

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mhartington/formatter.nvim')
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
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')

  -- Debugging
    use({'mfussenegger/nvim-dap',
	dependencies = {
	    'rcarriga/nvim-dap-ui',
	    'theHamsta/nvim-dap-virtual-text',
	    'nvim-neotest-nvim-nio',
	    'williamboman/manson.nvim'
	}
    })
    use({
	"rcarriga/nvim-dap-ui",
	requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    })
    use('theHamsta/nvim-dap-virtual-text')
    use('folke/neodev.nvim')
    use('mfussenegger/nvim-dap-python')
    use("Mgenuit/nvim-dap-kotlin")
  -- markdown preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- obsidian notetaking
  use({"epwalsh/obsidian.nvim",
     requires = "nvim-lua/plenary.nvim"
    })


  -- -- file management
  use({
	"stevearc/oil.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons"
	},
    })
  -- use{
  --   'nvim-tree/nvim-tree.lua',
  --   requires ={
  --       'nvim-tree/nvim-web-devicons',
  --       },
  --   }
  -- comment marked lines
  use('numToStr/Comment.nvim')
  -- automatic closing brackets
  use{'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
	require("nvim-autopairs").setup{}
	end
    }
    use{'windwp/nvim-ts-autotag',
	config = function ()
	    require('nvim-ts-autotag').setup({
		opts = {
		    -- Defaults
		    enable_close = true, -- Auto close tags
		    enable_rename = true, -- Auto rename pairs of tags
		    enable_close_on_slash = false -- Auto close on trailing </
		},
	    })
	end}
  -- automatic indenting
  use('tpope/vim-sleuth')
  -- locate errors/warnings etc.
  use{
    "folke/trouble.nvim",
    requires = { {"nvim-tree/nvim-web-devicons"} },
  }
end)

