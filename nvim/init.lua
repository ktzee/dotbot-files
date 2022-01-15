vim.cmd [[
 autocmd!
       autocmd BufWritePost init.lua source <afile>
 augroup end
]]
-- neovide
require "ktz.neovide"

-- mappings
require "ktz.mappings"

-- plugins
require "ktz.plugins"

-- settings
require "ktz.settings"

-- telescope
require "ktz.telescope"

-- plugin configs
require "ktz.plugins.config"
