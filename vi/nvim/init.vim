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

" Linters
Plugin 'w0rp/ale'

" Vim Buffer Kill
Plugin 'qpkorr/vim-bufkill'


" Other Plugins
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'

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
nnoremap <space> za



" ============ VIM User Interface  ================ "
" Highlight Current Line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

