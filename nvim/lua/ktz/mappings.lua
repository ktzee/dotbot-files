local opts = { noremap = true, silent = true }
-- autoreload this config on save
vim.cmd [[
  autocmd!
        autocmd BufWritePost mappings.lua source <afile>
  augroup end
]]
local key_map = vim.api.nvim_set_keymap
-- unmap space and map it as a leader
key_map('n', '<Space>', '', {})
vim.g.mapleader = ' '
-- damn q
key_map('n', 'Q', '', {})
-- reload config
key_map("n", "<leader>d", "<cmd>source $home/.config/nvim/init.lua<cr>", opts)
-- next tab
key_map("n", "<C-n>", "<cmd>tabnext<cr>", opts)
-- Better window navigation
key_map("n", "<C-h>", "<C-w>h", opts)
key_map("n", "<C-j>", "<C-w>j", opts)
key_map("n", "<C-k>", "<C-w>k", opts)
key_map("n", "<C-l>", "<C-w>l", opts)

-- Naviagate buffers
key_map("n", "<S-l>", ":bnext<CR>", opts)
key_map("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
key_map("v", "<", "<gv", opts)
key_map("v", ">", ">gv", opts)

key_map("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
key_map("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
key_map("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)

key_map("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
