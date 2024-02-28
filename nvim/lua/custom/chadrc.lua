---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'pastelDark',
	tabufline = {
		enabled = false,
	},
}
-- import custom plugins file
M.plugins = "custom.plugins"
-- import custom mappings file
M.mappings = require "custom.mappings"

vim.opt.relativenumber = true

-- required for obsidian.nvim
vim.opt.conceallevel = 2

return M
