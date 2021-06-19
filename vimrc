set nocompatible		" required
filetype off			" required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" POPE TIM POPE XIV
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
" js with vim and lint
Plug 'moll/vim-node'
Plug 'w0rp/ale'
" json
Plug 'elzr/vim-json'
" file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" tmux vim navigator
Plug 'christoomey/vim-tmux-navigator'
" Colorschemes
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
" vim polyglot
Plug 'sheerun/vim-polyglot'
" vim styled-components
Plug 'styled-components/vim-styled-components'
" Focuse mode
Plug 'merlinrebrovic/focus.vim'
" Git branch checkout
Plug 'stsewd/fzf-checkout.vim'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

if has('nvim')
	" Plug 'ObserverOfTime/discord.nvim'
endif


" Initialize plugin system
call plug#end()

let mapleader=","

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
nnoremap <silent> <Leader>json :%!python3 -m json.tool<CR>:w<CR>

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

" KEYBOARD HAS NO BACKTICK KEY
inoremap '' `

" KEYBOARD HAS NO TILDE KEY (FFS)
inoremap '? ~

" Focus Mode
let g:focus_use_default_mapping = 0
let g:focusmode_width = 80
nmap <Leader>fo <Plug>FocusModeToggle

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

" fzf-checkout window layout config & remap
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <Leader>gc :GCheckout<CR>
