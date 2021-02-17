let mapleader =","
set nu
syntax on
filetype plugin indent on

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Configure ack to use ag
let g:ackprg = 'ag --nogroup --nocolor --column'

call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/ying17zi/vim-live-latex-preview'
Plug 'lervag/vimtex'
Plug 'LaTeX-Box-Team/LaTeX-Box'
" IntelliSense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code search with ack - actually using "ag" - the_silver_searcher
Plug 'mileszs/ack.vim'
call plug#end()
