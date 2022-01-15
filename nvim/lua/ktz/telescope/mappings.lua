local opts = { noremap = true, silent = true }
local key_map = vim.api.nvim_set_keymap
key_map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true, silent = true})
key_map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true})
-- key_map('n', '<C-p>', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true})
key_map(
  "n",
  "<c-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  opts
)
key_map('n', '<leader>ft', "<cmd>lua require('telescope.builtin').builtin()<cr>", {noremap = true, silent = true})
key_map('n', '<leader>`', "<cmd>lua require('telescope.builtin').commands()<cr>", {noremap = true, silent = true})
key_map('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", {})
