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

return M
