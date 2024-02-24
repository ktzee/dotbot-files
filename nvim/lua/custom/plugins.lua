local overrides = require("custom.configs.overrides")

-- user-defined plugins and their configuration
-- uses lazy.nvim
local plugins = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "templ",
      "htmx-lsp",
      "tailwindcss-language-server",
      "html-lsp",
      "cssls",
      "emmet-ls",
      "svelte",
      "rust-analyzer",
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    init = function()
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- load default nvchad config
      require "plugins.configs.lspconfig"
      -- load our custom config
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"go", "templ"},
    opts = function ()
      -- these configs can be lenghty. Keep them in a separate file
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    -- auto-install deps
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    config = function ()
      require("harpoon"):setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmd,
    dependencies = {
      -- snippets
      "L3MON4D3/LuaSnip",
      config = function(_, opts)
        require("plugins.configs.others").luasnip(opts)
        require "custom.configs.luasnip"
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    require("telescope").setup {
      extensions = {
        file_browser = {
          hijack_netrw = false,
        }
      }
    }
  }
}
return plugins
