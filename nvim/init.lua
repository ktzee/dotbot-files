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

-- telescope
require "ktz.telescope"

-- plugins
require "ktz.plugins.init"

-- plugin configs
require "ktz.plugins.config"
