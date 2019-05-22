"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'

set encoding=UTF-8



" ============ Vundle Setup  ================ "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" LightLine & Bufferline
Plugin 'mmisono/battery.vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'mgee/lightline-bufferline'

" VimFiler
Plugin 'shougo/vimfiler.vim'

" NerdTree
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jistr/vim-nerdtree-tabs'

" Linters
Plugin 'w0rp/ale'

" Git
Plugin 'airblade/vim-gitgutter'

" Vim Buffer Kill
Plugin 'qpkorr/vim-bufkill'

" Other Plugins
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'luochen1990/rainbow'
Plugin 'brooth/far.vim'

call vundle#end()



" ============ VIM Plugins & Shortcuts  ================ "
" ALE Linter
" enable completion where available.
" this setting must be set before ALE is loaded.
let b:ale_linters=['pyflakes', 'flake8', 'pylint', "eslint"]
let g:ale_completion_enabled=1

" Enable code folding
filetype plugin indent on
let g:SimpylFold_docstring_preview=1
set foldlevel=1
set foldmethod=indent
nnoremap <space><space> za

" Disable Linting Windows
" let g:spacevim_lint_on_save=0
let g:ale_open_list=0
" let g:ale_set_loclist=0
" let g:ale_set_quickfix=0
" let g:ale_keep_list_window_open=0

" Ale Python3 Support
let g:ale_python_flake8_executable='python3'
let g:ale_python_flake8_options='-m flake8'

" Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bin\|include\|lib\|__pycache__'

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Python specific commands
" Run selected python code in interpreter
xnoremap <space>p :w !python3<cr>



" ============ VIM User Interface  ================ "
" NERDTree config
" Hide helper text, hide common/lib files
"let NERDTreeMinimalUI=1
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\~$','\.DS\_Store','\*\.swp','__pycache__', '\.pyc$']
" Nerdtree to right and set nerdtree width
"let g:NERDTreeWinPos="right"
"let NERDTreeWinSize=30

" Open nerdtree on start (even if only one file is opened)
" autocmd VimEnter * NERDTree
" Open nerdtree if no file is specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Change focus to main window instead of nerdtree
"autocmd VimEnter * wincmd p

" Close nerdtree if it is the only one opened
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerdtree key mapping to open/close
map <C-n> :NERDTreeToggle<CR>


" Space Vim disable nerdtree
let g:spacevim_enable_vimfiler_welcome=1

" Highlight Current Line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Color Scheme
colorscheme gruvbox 

" Lightline & Bufferline
" let g:lightline = {
"    \'colorscheme': 'wombat',
"    \'separator': { 'left': '', 'right': '' },
"    \'subseparator': { 'left': '', 'right': '' }
"    \}
"let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"let g:lightline.component_type   = {'buffers': 'tabsel'}
"set showtabline=2

" rainbow parantheses
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Space Vim (disable Linter Window)
let g:neomake_open_list = 0

" Vim, tabs to space
:set tabstop=4
