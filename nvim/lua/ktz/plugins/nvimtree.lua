require'nvim-tree'.setup({
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = false,
      ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
      },
      update_to_buf_dir = {
        enable = true,
        auto_open = true,
      },
      auto_close = true,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 200,
      },
      view = {
        width = 30,
        height = 30,
        side = "left",
        auto_resize = true,
        number = false,
        relativenumber = false,
        mappings = {
          custom_only = false,
          list = {},
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" },
      },
    })
    show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    quit_on_open = 0,
    git_hl = 1,
    disable_window_picker = 0,
    root_folder_modifier = ":t",
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
})
