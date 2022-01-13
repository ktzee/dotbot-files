vim.cmd [[
  autocmd!
  	autocmd BufWritePost mappings.lua source <afile>
  augroup end
]]
local key_map = vim.api.nvim_set_keymap

-- NORMAL mode
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- `gb[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- NOTE: Dot repeat is not supported with [count]gcc and [count]gbc
--
-- VISUAL mode
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment


