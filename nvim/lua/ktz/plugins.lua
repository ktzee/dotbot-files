-- install packer automatically on new system
-- https://github.com/wbthomason/packer.nvim#bootstrapping
-- Arch: https://aur.archlinux.org/packages/nvim-packer-git/

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
	use 'ghifarit53/tokyonight-vim'
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
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { "nvim-telescope/telescope-file-browser.nvim" }
  use "jvgrootveld/telescope-zoxide"
	use "dhruvmanila/telescope-bookmarks.nvim"
	use "cljoly/telescope-repo.nvim"
	use {
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
  }
	use "nvim-telescope/telescope-github.nvim"
  -- Generic Dev
  use "neovim/nvim-lspconfig"
  use "nvim-lua/lsp_extensions.nvim"
  use "windwp/nvim-autopairs"
  use "andymass/vim-matchup"
  use "ray-x/lsp_signature.nvim"
  use "onsails/lspkind-nvim"
  -- Fancyness
	use {
	"nvim-lualine/lualine.nvim",
	config = function()
		require "ktz.statusline"
	end,
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}
  use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
  }
  use "chrisbra/Colorizer"
  use "kyazdani42/nvim-web-devicons"
  use "lukas-reineke/indent-blankline.nvim"
  use "rcarriga/nvim-notify"
  use "nvim-lua/plenary.nvim"
  use { "stevearc/dressing.nvim" }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
	-- sitting
	use {
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "nvim-treesitter/nvim-treesitter-refactor"
	use "nvim-treesitter/playground"
	use "nvim-treesitter/nvim-treesitter-textobjects"
	use "David-Kunz/treesitter-unit"
	use "jose-elias-alvarez/nvim-lsp-ts-utils"
  -- nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "ray-x/cmp-treesitter" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "Saecki/crates.nvim" },
      { "f3fora/cmp-spell" },
      -- { "hrsh7th/cmp-cmdline" },
      { "tamago324/cmp-zsh" },
    },
		config = function()
			require "ktz.completion"
		end,
  }
end)

