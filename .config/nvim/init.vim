call plug#begin('~/.config/nvim/plugins')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

set nu
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2

"vim-airlines-theme"
let g:airline_theme='minimalist'
