set nu
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2

"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.config/nvim/plugins')
	Plug 'dense-analysis/ale'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
	Plug 'preservim/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'herringtondarkholme/yats.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'mattn/emmet-vim'
call plug#end()

" Ale formatters
let b:ale_fixers = ['prettier']
map <C-S-i> :ALEFix<CR>

" Commentary
map cm <Plug>Commentary

" Nerd Tree
map <C-b> :NERDTreeToggle<CR>

" Airline theme
let g:airline_theme='minimalist'

" Ignore certain directories
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

