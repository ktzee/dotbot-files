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
      "prettier",
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
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
    -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
  },
    config = function (_, opts)
        require("noice").setup(opts)
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
    opts = {
      sources = {
        { name = "cmdline" },
        { name = "nvim_lsp" },
        { name = "path"},
        { name = "luasnip"},
        { name = "buffer" },
        { name = "nvim_lua"},
      },
      experimental = {
        ghost_text = true
      },
    },
    dependencies = {
      "L3MON4D3/LuaSnip",       -- snippets
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      event = { "CmdLineEnter" },
      opts = { history = true, updateevents = "CmdlineEnter, CmdlineChanged"},
      config = function(_, opts)
        require("plugins.configs.others").luasnip(opts)
        require "custom.configs.luasnip"
        require("luasnip/loaders/from_vscode").lazy_load()

        local cmp = require "cmp"
        cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer"},
        },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
              name = "cmdline",
              option = {
               ignore_cmds = {"Man", "!"},
              },
            }),
      })
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
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Sync/obsidian/brain",
        },
        {
          name = "work",
          path = "~/Sync/obsidian/work",
        },
      },
      -- completion = {
      --     nvim_cmp = true,
      --     min_chars = 2,
      --     --  * "current_dir" - put new notes in same directory as the current buffer.
      --     --  * "notes_subdir" - put new notes in the default notes subdirectory.
      --     new_notes_location = "current_dir",
      --     -- 1. Whether to add the note ID during completion.
      --     -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
      --     prepend_note_id = true,
      --         }
      -- },
      templates = {
        subdir = "_templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        tags = "",
        substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end
      },
      ui = {
          enable = true,
      },
    },
  },
  },
}
return plugins
