-- sync plugins on write/save
vim.cmd [[
  augroup packer_sync_plugins
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	-- Themes and Rice
  use 'ghifarit53/tokyonight-vim'
	use {
		"nvim-lualine/lualine.nvim",
		config = function()
			require "ktz.statusline"
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}
	use "folke/which-key.nvim"
	-- Editing/IDE
	use "tpope/vim-surround"
	use "andymass/vim-matchup"
	use "tpope/vim-fugitive"
	use 'numToStr/Comment.nvim'
	--use "akinsho/toggleterm.nvim"
	use "windwp/nvim-autopairs"
	use "lukas-reineke/indent-blankline.nvim"
	use "norcalli/nvim-colorizer.lua"
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    }
	}
	-- Languages and Completion
	use 'neovim/nvim-lspconfig'
	use "onsails/lspkind-nvim"
	use "ray-x/lsp_signature.nvim"
	use 'sstallion/vim-whitespace'
	use {
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	}
	-- markdown plugins
	use "ellisonleao/glow.nvim"
	use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
	-- json pathing
	use "mogelbrod/vim-jsonpath"
	-- Completion
  -- Rust
  use "rust-lang/rust.vim"
  use "simrat39/rust-tools.nvim"
	-- Lua
	use "folke/lua-dev.nvim"
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
  }
	-- use Telescope for vim.ui.select
	use 'nvim-telescope/telescope-ui-select.nvim'
	-- Treesitter
	use "nvim-treesitter/nvim-treesitter" 
end)
