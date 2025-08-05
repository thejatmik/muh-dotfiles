set nocompatible                " required
filetype off                    " required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plug 'dense-analysis/ale'
" Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" POPE TIM POPE XIV
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'vim-airline/vim-airline'
" go with vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim' " go install github.com/cweill/gotests/gotests@latest
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
" vim styled-components
Plug 'styled-components/vim-styled-components'
" Focuse mode
Plug 'merlinrebrovic/focus.vim'
" Git branch checkout
Plug 'stsewd/fzf-checkout.vim'
" vim-polyglot for indent
Plug 'sheerun/vim-polyglot'

" CoC is my new best friend
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" so i can show off my waifu wallpaper
Plug 'tribela/vim-transparent'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()

let mapleader=","

filetype plugin indent on       " required

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
au BufNewFile,BufRead *.js,*.html,*.css,*.vue,*.ts,*.jsx,*.tsx
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

" vim-go
nnoremap <silent> <Leader>gor :w<CR>:GoRun<CR>
nnoremap <silent> <Leader>goi :w<CR>:GoImpl<CR>
nnoremap <silent> <Leader>gos :w<CR>:GoFillStruct<CR>

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" IF KEYBOARD HAS NO BACKTICK KEY
" inoremap '' `

" IF KEYBOARD HAS NO TILDE KEY (FFS)
" inoremap '? ~

" CoC extensions
let g:coc_global_extensions = [
                        \'coc-tsserver',
                        \'coc-json',
                        \'coc-html',
                        \'coc-css',
                        \'coc-pyright',
                        \'coc-eslint',
                        \'coc-go',
                        \'coc-glslx',
                        \'coc-sh',
                        \'coc-sql',
                        \'coc-discord-rpc',
                        \]
" add 'coc-discord-rpc', " set :CocConfig first

" Coc show diagnostic errors
nnoremap <Leader>le :CocDiagnostics<CR>

" Focus Mode
let g:focus_use_default_mapping = 0
let g:focusmode_width = 80
nmap <Leader>fo <Plug>FocusModeToggle

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

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
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.85 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <Leader>gc :GCheckout<CR>
" fzf preview window
let g:fzf_preview_window = ['right,69%', 'ctrl-/']

" gotests-vim config
let g:gotests_bin = $GOPATH.'/bin/gotests'
let g:gotests_template = ''

" vim-airline, simplifying
let g:airline_section_y = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" ensure editorconfig works with fugitive and remote files
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
