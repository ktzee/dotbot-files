vim.cmd [[
 autocmd!
       autocmd BufWritePost init.lua source <afile>
 augroup end
]]
-- neovide
require "ktz.neovide"

-- mappings
require "ktz.mappings"

-- settings
require "ktz.settings"

-- plugins
require "ktz.plugins.init"

-- plugin configs
require "ktz.plugins.config"

-- telescope
require "ktz.telescope"
