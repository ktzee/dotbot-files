local builtin = require('telescope.builtin')
local wk = require('which-key')

-- leader group key configuration is done using which-key
wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
        f = { builtin.find_files, "Find File" },
        b = { builtin.buffers, "Find Buffers" },
        c = { builtin.commands, "Find nvim Commands" },
        t = { builtin.treesitter, "Find Treesitter Symbols" },
        g = { builtin.live_grep, "Live Grep" },
        G = { function() builtin.grep_string({ search = vim.fn.input("Grep > ")}) end, "Grep Project" },
    },
  },
})
-- search only files in the git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Git Files Find"})
-- project find
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Project Find"})
-- grep for a pattern across files
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ")});
-- end, {desc = "grep through project"})


-- builtins
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live Grep"})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Buffers"})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help Tags"})
-- vim.keymap.set('n', '<leader>fc', builtin.commands, {desc = "Commands"})
-- vim.keymap.set('n', '<leader>ft', builtin.treesitter, {desc = "Treesitter"})

