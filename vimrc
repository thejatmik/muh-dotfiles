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
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'moll/vim-node'
" js with vim and lint
Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'prettier/vim-prettier'
" json
Plugin 'elzr/vim-json'
" gql and/or graphql
Plugin 'jparise/vim-graphql'
" file finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" multiple cursor (C^n in vscode)
Plugin 'terryma/vim-multiple-cursors'
" tmux vim navigator
Plugin 'christoomey/vim-tmux-navigator'
" Colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'

if has('nvim')
	" Plugin 'ObserverOfTime/discord.nvim'
endif

let mapleader=","

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on 	" required

set splitbelow
set splitright
set expandtab

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
	\ set autoindent |

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" auto set for go file
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4

set encoding=utf-8

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

if has('gui_runing')
	set background=dark
	colorscheme default
else
	colorscheme gruvbox
endif
set bg=dark

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu rnu

set clipboard=unnamed

let g:syntastic_python_checkers=['flake8']

set timeoutlen=850 ttimeoutlen=0

" cursor column
set cursorcolumn
set cursorline

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:powerline_pycmd = 'py3'

" vim-prettier, auto format files with @format or @prettier tag
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" ALEFixer
let g:ale_fixers = {
	\ 'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 0

" VIMJavascript
" let g:javascript_plugin_flow = 1
let g:javacript_plugin_jsdoc = 1

" Vim-JSX-Pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1
