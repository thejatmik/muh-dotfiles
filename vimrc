set nocompatible		" required
filetype off			" required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'
" Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" POPE TIM POPE XIV
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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

" CoC is my new best friend
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('nvim')
	" Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
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

" scroll offset keep some lines visible when moving cursor
set scrolloff=6


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

" NERDTree
nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>

" FZF search file
nnoremap <silent> <Leader>sf :GFiles<CR>
nnoremap <silent> <Leader>sr :Rg<CR>

" FUGITIVE hotkeys
nnoremap <Leader>gs :Git<CR>

" Remap ctrl+^ : <leader> then f to open previous file
nnoremap <silent> <Leader>w <C-^><CR>

" ALEFIX
nnoremap <silent> <Leader>alef :ALEFix<CR>

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" IF KEYBOARD HAS NO BACKTICK KEY
" inoremap '' `

" IF KEYBOARD HAS NO TILDE KEY (FFS)
" inoremap '? ~

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-pyright', 'coc-eslint', 'coc-go', 'coc-glslx', 'coc-sh', 'coc-sql']

" Focus Mode
let g:focus_use_default_mapping = 0
let g:focusmode_width = 80
nmap <Leader>fo <Plug>FocusModeToggle

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:syntastic_python_checkers=['flake8']
let g:syntastic_typescript_tsc_fname = ''

highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:powerline_pycmd = 'py3'

" ALEFixer
let g:ale_fixers = {
	\ 'javascript': ['eslint'],
        \ 'vue': ['eslint'],
	\ 'typescript': ['eslint'],
\}
let g:ale_fix_on_save = 0

" fzf-checkout window layout config & remap
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <Leader>gc :GCheckout<CR>
