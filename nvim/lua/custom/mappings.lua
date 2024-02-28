-- user-defined key mappings
local M = {}

-- custom keymaps
M.mine = {
  n = {
    ["<leader>s"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Replace under cursor"
    },
    ["<leader>pp"] = {
      [["_dP]],
      "Paste below, retain content of register"
    },
    ["L"] = {"$"},
    ["H"] = {"^"},
    ["<leader>qq"] = {
      ":wqa!<CR>",
      "Save all buffers and force close nvim"
    },
    ["<leader>xx"] = {
      ":!chmod +x %<CR>",
      "Flag current file as executable"
    },
    ["<leader>x"] = {
      ":!%:p<CR>",
      "Flag current file as executable"
    },
  },
  v = {
    ["J"] = {
      [[:m '>+1<CR>gv=gv]],
      "Move selected text down"
    },
    ["K"] = {
      ":m '<-2<CR>gv=gv",
      "Move selected text up"
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    -- "go struct json"
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function ()
        require("harpoon"):list():append()
      end,
      "Harpoon add file",
    },
    ["<leader>e"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "Harpoon toggle menu",
    },
    ["<A-1>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Harpoon nav file 1",
    },
    ["<A-2>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Harpoon nav file 2",
    },
    ["<A-3>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Harpoon nav file 3",
    },
    ["<A-4>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Harpoon nav file 4",
    },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<C-p>"] = {
      function ()
        require('telescope.builtin').find_files()
      end,
      "Find files with Telescope"
    },
    ["<C-S-p>"] = {
      function ()
        require('telescope.builtin').buffers()
      end,
      "Find open buffers with Telescope"
    },
    ["<leader>fc"] = {
      function ()
        require('telescope.builtin').commands()
      end,
      "Find commands with Telescope"
    },
    ["<leader>ld"] = {
      function ()
        require('telescope.builtin').diagnostics()
      end,
      "List Diagnostics from Treesitter!"
    },
    ["<A-e>"] = {
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      "Open Telescope File Manager"
    }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>dc"] = {
      function ()
        require('dap').continue()
      end,
      "Start/Continue Debug"
    },
    ["<leader>di"] = {
      function ()
        require('dap').step_into()
      end,
      "Step Into"
    },
    ["<leader>do"] = {
      function ()
        require('dap').step_over()
      end,
      "Step Over"
    },
    ["<leader>ds"] = {
      function ()
        require('dap').repl.open()
      end,
      "Inspect State using REPL"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    },
  }
}

return M
