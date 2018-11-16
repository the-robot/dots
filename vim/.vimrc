syntax enable
set encoding=utf-8


" ============ Vundle Setup  ================ "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Terminal
Plugin 'jewes/Conque-Shell'

" Git
Plugin 'airblade/vim-gitgutter'

" LightLine & Bufferline
Plugin 'mmisono/battery.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mgee/lightline-bufferline'

" Linters
Plugin 'w0rp/ale'

" Other Plugins
Plugin 'morhetz/gruvbox'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'qpkorr/vim-bufkill'


call vundle#end()



" ============ VIM Plugins & Shortcuts  ================ "
let g:python_highlight_all=1

" ALE Linter
" enable completion where available.
" this setting must be set before ALE is loaded.
let b:ale_linters=['pyflakes', 'flake8', 'pylint', "eslint"]
let g:ale_completion_enabled=1

" ConqueTerm Shell
" autocmd VimEnter * execute "normal \<C-L>"

" Key mapping for split navigations
" i.e. switch from nerd tree to code editor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Key mapping for cycling through buffers
" i.e. changing code editor tabs
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Enable code folding
filetype plugin indent on
let g:SimpylFold_docstring_preview=1
set foldlevel=1
set foldmethod=indent
nnoremap <space> za

" Python PEP8 Indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=80
    \ set expandtab
    \ set autoindent
    \ fileformat=unix
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$\
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" NERDTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$','\.DS\_Store','\*\.swp','__pycache__', '\.pyc$']
let NERDTreeWinSize=25
autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" ============ VIM User Interface  ================ "
set background=dark
set backspace=indent,eol,start

" For powerline shell, always show statusline
set laststatus=2
" Use 256 colors
set t_Co=256

" Line Numbering
set nu

" Lightline/Bufferline settings
let g:lightline = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2

" Color Scheme
syntax on
colorscheme onedark
"let g:lightline={ 'colorscheme': 'onedark', }

" Highlight Current Line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Nerdtree Tabs
let g:nerdtree_tabs_open_on_console_startup=1
