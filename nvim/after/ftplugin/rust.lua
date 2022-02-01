-- nvim_lsp object
local nvim_lsp = require "lspconfig"

-- treesitter folding
-- vim.opt_local.foldmethod = "expr"
-- vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt_local.foldnestmax = 3
-- vim.opt_local.foldlevel = 1

-- Enable rust_analyzer
-- rust-analyzer 54782428a 2022-01-12 dev
nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
	on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsFromCheck = true },
      procMacro = { enable = true },
    },
  },
}
-- rust-tools config: https://github.com/simrat39/rust-tools.nvim
-- You want this if you're a Rust developer.
-- @TODOUA: selects on *abbles require manual close with no select
-- ... not handling nil in select telescope or otherwise
require("rust-tools").setup {}

-- snippets dir- vsnip. Need to try LuaSnip
-- vim.b.vsnip_snippet_dir = vim.fn.expand "~/.config/nvim/snippets/"

-- Command:
-- RustRunnables
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<space>rr",
  [[<cmd>lua require('rust-tools.runnables').runnables()<CR>]],
  { noremap = true, silent = true }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<F2>",
  [[<cmd>lua require'rust-tools.hover_actions'.hover_actions()<CR>]],
  { noremap = true, silent = true }
)

vim.api.nvim_exec(
  [[
" rainbow color HLs
hi rainbowcol1 guifg=#91D2A3
hi rainbowcol2 guifg=#3791D4
hi rainbowcol3 guifg=#8182EB
hi rainbowcol4 guifg=#BCCEA3
hi rainbowcol6 guifg=#1B9C36
]],
  false
)
