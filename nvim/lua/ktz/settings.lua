-- apply changes on write/save
vim.cmd [[
  autocmd!
        autocmd BufWritePost settings.lua source <afile>
  augroup end
]]
local set = vim.opt
set.number = true
set.relativenumber = true
set.ignorecase = true
set.smartcase = true
set.hidden = true
set.splitbelow = true
set.splitright = true
set.timeoutlen = 100
set.termguicolors = true
set.updatetime = 2000
set.tabstop = 2
set.shiftwidth = 2
set.completeopt = "menu,menuone,preview,noselect,noinsert"
set.inccommand = "split"
set.incsearch = true
set.pumblend = 5
vim.cmd [[ 
	colorscheme tokyonight
	set clipboard=unnamedplus
	" syntax highlight only to 1K instead of default 3K
	set synmaxcol=1000
	set wildignore+=*/node_modules/*,*/coverage/*
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
	set grepformat=%f:%l:%c:%m,%f:%l:%m
	set dictionary+=/usr/share/dict/words-insane "AUR: words-insane
	set guifont=FiraCode\ Nerd\ Font\ Mono:12
]]

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
