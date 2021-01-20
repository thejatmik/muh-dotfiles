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

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
" js with vim and lint
Plugin 'moll/vim-node'
Plugin 'w0rp/ale'
" json
Plugin 'elzr/vim-json'
" file finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" tmux vim navigator
Plugin 'christoomey/vim-tmux-navigator'
" Colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'
" vim polyglot
Plugin 'sheerun/vim-polyglot'

if has('nvim')
	" Plugin 'ObserverOfTime/discord.nvim'
endif

let mapleader=","

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

set splitbelow
set splitright
set expandtab

" Enable folding
set foldmethod=indent
set foldlevel=99

set encoding=utf-8
set nowrap

" flexible sensitive/non-sensitive case search
set ignorecase
set smartcase

" hybrid linenumber - relative
set nu rnu

set bg=dark
set clipboard=unnamed
set timeoutlen=850 ttimeoutlen=0
"
" cursor column
set cursorcolumn
set cursorline
set colorcolumn=80


" Enable folding with the spacebar
nnoremap <space> za

" auto indent for python
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set autoindent |
	\ set fileformat=unix

" auto indent for javascript
au BufNewFile,BufRead *.js,*.html,*.css,*.vue
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set autoindent

" auto indent for protobuf
au BufNewFile,BufRead *.proto
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set autoindent

" auto indent for yaml
au BufNewFile,BufRead *.yaml,*.yml
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
        \ set foldmethod=indent

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" auto set for go file
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4

if has('gui_runing')
	set background=dark
	colorscheme default
else
	colorscheme gruvbox
endif

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" window split
nnoremap <silent> <Leader>wq <C-W><C-Q>
nnoremap <silent> <Leader>wh <C-W><C-S>
nnoremap <silent> <Leader>wv <C-W><C-V>

" auto format JSON in opened buffer
nnoremap <silent> <Leader>json :%!python -m json.tool<CR>:w<CR>

" YCM autoclose preview window, go to definition, fixer
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter Fixit<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>

" NERDTree
nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>

" FZF search file
nnoremap <silent> <Leader>sf :GFiles<CR>
nnoremap <silent> <Leader>sr :Rg<CR>

" FUGITIVE hotkeys
nnoremap <Leader>gs :Gstatus<CR>

" Remap ctrl+^ : <leader> then f to open previous file
nnoremap <silent> <Leader>w <C-^><CR>

" ALEFIX
nnoremap <silent> <Leader>alef :ALEFix<CR>

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:syntastic_python_checkers=['flake8']

highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:powerline_pycmd = 'py3'

" ALEFixer
let g:ale_fixers = {
	\ 'javascript': ['eslint'],
        \ 'vue': ['eslint'],
\}
let g:ale_fix_on_save = 0
