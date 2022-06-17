local lspconfig = require "lspconfig"
-- VimL (full circle!)
require("lspconfig").vimls.setup {}
-- nvim_lsp object
local nvim_lsp = require "lspconfig"

-- `eslint` lang server setup through lspconfig
-- vscode-langservers-extracted@3.0.2 → https://github.com/hrsh7th/vscode-langservers-extracted
nvim_lsp.eslint.setup {
  on_attach = function(client)
    -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
    -- the resolved capabilities of the eslint server ourselves!
    client.resolved_capabilities.document_formatting = true
  end,
  settings = {
    format = { enable = true },
  },
}

-- LSP signs default
vim.fn.sign_define(
  "DiagnosticSignError",
  { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarning",
  { texthl = "DiagnosticSignWarning", text = "", numhl = "DiagnosticSignWarning" }
)
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" })

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})

require'nvim-tree'.setup {
}

require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		lua = {"string", "source"},
		javascript = {"string", "template_string"},
		java = false,
	},
})
require('Comment').setup()
require('colorizer').setup()
require("which-key").setup()
