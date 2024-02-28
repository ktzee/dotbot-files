-- we override tables to configure plugins in plugins.configs
local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "go",
    "markdown",
    "rust",
    "markdown_inline",
    "python",
    "templ",
    "svelte",
    "regex",
    "bash"
  },
  indent = {
    enable = true,
  }
}

return M
