-- apply changes on write/save
vim.cmd [[
  autocmd!
  	autocmd BufWritePost settings.lua source <afile>
  augroup end
]]

local set = vim.opt
set.number = true
set.relativenumber = true
set.completeopt = "menu,menuone,preview,noselect,noinsert"
set.inccommand = "split"
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hidden = true
set.splitbelow = true
set.splitright = true
set.showcmd = false
set.updatetime = 2000
set.tabstop = 2
set.shiftwidth = 2
set.pumblend = 5
set.termguicolors = true
set.timeoutlen = 500
vim.g.mapleader = ','
-- Theme
vim.cmd [[colorscheme tokyonight]]

-- * Colorizer *
-- auto color fts
vim.g.colorizer_auto_filetype = "yaml,zsh,zsh-theme,lua,vim,json"
-- keep colorizing on bufleave
vim.g.colorizer_disable_bufleave = 1

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

-- turn on cursorline, cursorcolumn when searching, sync with hlsearch
vim.api.nvim_exec(
  [[
augroup nvim-incsearch-cursorline
	autocmd!
	autocmd CmdlineEnter /,\? :set cursorline cursorcolumn hlsearch
augroup END
]],
  false
)

-- Options in VimL form
vim.cmd [[
set termguicolors
" syntax highlight only to 1K instead of default 3K
set synmaxcol=1000
let &packpath=&runtimepath
set dictionary+=/usr/share/dict/words
set wildignore+=*/node_modules/*,*/coverage/*
set guicursor=
set clipboard=unnamedplus
set undodir=~/.config/nvim/undodir
set undofile
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m
]]

