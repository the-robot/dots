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
" Plugin 'shougo/vimfiler.vim'

" NerdTree
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jistr/vim-nerdtree-tabs'

" FZF
Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'

" Linters
Plugin 'w0rp/ale'

" Git
Plugin 'airblade/vim-gitgutter'

" Commentary
Plugin 'tpope/vim-commentary'


" LANGUAGES
" Javascript & Typescript
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'

" Templating Syntax
Plugin 'mustache/vim-mustache-handlebars'

" React
Plugin 'mxw/vim-jsx'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components'


" CSS Color
Plugin 'ap/vim-css-color'

" Markdown & Latex
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'


" Other Plugins
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'luochen1990/rainbow'
Plugin 'brooth/far.vim'
Plugin 'Asheq/close-buffers.vim'
Plugin 'yuttie/comfortable-motion.vim'

call vundle#end()



" ============ VIM Plugins & Shortcuts  ================ "
" ALE Linter
" enable completion where available.
" this setting must be set before ALE is loaded.
let g:ale_linters = {
\   'python': ['pyflakes', 'flake8', 'pylint'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled=1

" Disable Linting Windows
" let g:spacevim_lint_on_save=0
let g:ale_open_list=0
" let g:ale_set_loclist=0
" let g:ale_set_quickfix=0
" let g:ale_keep_list_window_open=0

" Ale Python3 Support
let g:ale_python_flake8_executable='python3'
let g:ale_python_flake8_options='-m flake8'

" Set tsx and jsx as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx


" Shortcut to go to next or previous linting warnings
nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error


" Enable code folding
filetype plugin indent on
let g:SimpylFold_docstring_preview=1
set foldlevel=1
set foldmethod=indent
nnoremap <space><space> za


" Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bin\|include\|lib\|__pycache__'

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" CloseBuffers custom shortcuts
nnoremap <silent> <C-q> :Bdelete select<CR>

" Python shortcuts
" Run selected python code in python shell
xnoremap <space>P :w !python3<cr>

" Javascript shortcuts
" Run selected javascript code in node
xnoremap <space>N :w !node<cr>

" Bash shortcuts
" Run selected bash code in shell
xnoremap <space>B :w !bash<cr>

" Save file shortcut
nnoremap <C-w> :w<CR>


" FZF
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}


" ============ VIM User Interface  ================ "
" NERDTree config
" Hide helper text, hide common/lib files
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=[
            \  '\~$',
            \ '\.DS\_Store',
            \ '\*\.swp',
            \ '\.vscode',
            \ '\.idea',
            \ '\.gitee',
            \ '\.github',
            \ '\.ci',
            \ '__pycache__',
            \ '\.pyc$',
            \ '\.pytest_cache',
            \ '\.Python',
            \ '\.expo',
            \ '\.expo-shared',
            \ '\.next',
            \ 'node_modules',
            \ 'package-lock.json',
            \ 'yarn.lock',
            \ 'bin',
            \ 'include',
            \ 'lib',
\ ]
" Nerdtree to right and set nerdtree width
let g:NERDTreeWinPos="right"
let NERDTreeWinSize=30

" Open nerdtree on start (even if only one file is opened)
autocmd VimEnter * NERDTree
" Open nerdtree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Change focus to main window instead of nerdtree
autocmd VimEnter * wincmd p

" Close nerdtree if it is the only one opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" VimFiler/Nerdtree key mapping to open/close
map <C-n> :NERDTreeToggle<CR>
"map <C-n> :VimFiler<CR>

" Space Vim disable nerdtree
"let g:spacevim_enable_vimfiler_welcome=1

" Highlight Current Line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Color Scheme
colorscheme monokai_pro

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
:set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" set 2 spaces for Javascript and Typescript
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab


" Syntax UI Config
" Enable JS library syntax(s)
autocmd BufNewFile,BufRead *.hbs set filetype=html.mustache
let g:mustache_abbreviations = 1
