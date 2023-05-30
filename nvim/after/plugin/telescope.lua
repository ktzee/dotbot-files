local builtin = require('telescope.builtin')
-- project find
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Project Find"})
-- search only files in the git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Git Files Find"})
-- grep for a pattern across files
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end, {desc = "grep through project"})
