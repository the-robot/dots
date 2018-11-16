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
Plugin 'airblade/vim-gitgutter'

" AirLiner / LightLine
Plugin 'mmisono/battery.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'

" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython'
Plugin 'vim-python/python-syntax'

" Linters
"Plugin 'vim-syntastic/syntastic'
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
let g:python_highlight_all = 1

" ALE Linter
" enable completion where available.
" this setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" ConqueTerm Shell
" autocmd VimEnter * execute "normal \<C-L>"

" Key mapping for split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Key mapping for cycling through buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Enable code folding
filetype plugin indent on
let g:SimpylFold_docstring_preview=1
set foldlevel=1
set foldmethod=indent
" folding with spacebar
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
let NERDTreeIgnore=['\.pyc$','\~$','\.DS\_Store','\*\.swp','__pycache__'] "Ignore files for nerdtree
let NERDTreeWinSize=31
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

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview=1
let g:airline_theme='onedark'

" Color Scheme
syntax on
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Highlight Current Line
augroup CursorLine
      au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
          au WinLeave * setlocal nocursorline
      augroup END

