call plug#begin('~/.config/nvim/plugins')
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
call plug#end()

set nu
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2

let g:airline_theme='minimalist'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

""""""""""""
" Mappings "
""""""""""""
map cm <Plug>Commentary
map <C-b> :NERDTreeToggle<CR>
