set nu
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ignorecase
set incsearch
set hlsearch

"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.config/nvim/plugins')
	Plug 'arcticicestudio/nord-vim'
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
	Plug 'preservim/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'mattn/emmet-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" Too slow
	" Plug 'sheerun/vim-polyglot'
call plug#end()

" Prettier 
map <C-S-i> :PrettierAsync<CR>
let g:prettier#config#print_width = 80
let g:prettier#config#single_quote = 80
let g:prettier#config#semi = 'true'
let g:prettier#config#arrowParens = 'avoid'
let g:prettier#config#useTabs = 'false'
let g:prettier#config#endOfLine = 'lf'
let g:prettier#config#trailingComma = 'es5'


" Commentary
map cm <Plug>Commentary
map <C-/> :cml<CR>

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Airline theme
let g:airline_theme='nord'

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1


"""""""""
" Theme "
"""""""""
colorscheme nord

""""""
" GO "
""""""

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
