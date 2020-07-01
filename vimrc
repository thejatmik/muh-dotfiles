set nocompatible		" required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a apath where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle 
" used Bundle instead of Plugin)

" ...
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'moll/vim-node'
" js with vim and lint
Plugin 'w0rp/ale'

if has('nvim')
	Plugin 'ObserverOfTime/discord.nvim'
endif

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on 	" required

set splitbelow
set splitright

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" auto indent for python
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" auto indent for javascript
au BufNewFile,BufRead *.js,*.html,*.css,*.vue
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" auto indent for protobuf
au BufNewFile,BufRead *.proto
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set autoindent |
	\ set expandtab

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g	:YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

if has('gui_runing')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

call togglebg#map('<F5>')

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu

set clipboard=unnamed

let g:syntastic_python_checkers=['flake8']

set timeoutlen=1000 ttimeoutlen=0

" cursor column
set cursorcolumn
set cursorline

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

let g:powerline_pycmd = 'py3'

" ALEFixer
let g:ale_fixers = {
	\ 'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
