vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File Manager" })

-- fuck Q
vim.keymap.set("n", "Q", "<nop>")

-- disable F1
vim.keymap.set({"n", "v", "i"}, "F1", "<nop>")

-- move lines in V mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- j but cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- Cd and Cu but cursor stays in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without losing buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste Keep Buffer" })

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to Sys Clip"})
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line to Sys Clip" })

-- use tmux to change projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format buffer with LSP
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format Buffer" })

-- start replacing the word you're on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Start Replacing this word"})

