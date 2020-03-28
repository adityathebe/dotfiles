set nu
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2


"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.config/nvim/plugins')
	Plug 'morhetz/gruvbox'
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
	Plug 'preservim/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'ryanoasis/vim-devicons'
	Plug 'mattn/emmet-vim'
call plug#end()

" Ale formatters
map <C-S-i> :Prettier<CR>

" Commentary
map cm <Plug>Commentary
map <C-/> :cml<CR>
" Nerd Tree
map <C-b> :NERDTreeToggle<CR>

" Airline theme
let g:airline_theme='gruvbox'

" Ignore certain directories
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"""""""""
" Theme "
"""""""""
colorscheme gruvbox

