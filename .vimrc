filetype plugin on
set nocompatible              " be iMproved, required
set number
filetype plugin indent on
syntax on
set autoindent
set cursorline   " highlight current line
set cursorcolumn " highlight current column
set showmatch
set linebreak
" leader keymap
let mapleader = ","



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"-----------------------------------------
"		WEB DEVELOPPMENT
"-----------------------------------------
Plugin 'ap/vim-css-color'

"------------------------------------------
"		PYTHON
"------------------------------------------
Plugin 'vim-scripts/indentpython.vim'


"-----------------------------------------
"		AUTOCOMPLETE
"-----------------------------------------


"-----------------------------------------
"	ALIGNMENT / REFACTORING
"-----------------------------------------
Plugin 'junegunn/vim-easy-align'
Plugin 	'scrooloose/nerdtree'
Plugin 	'itchyny/lightline.vim'
"-----------------------------------------
"	LINTING
"-----------------------------------------
Plugin 	'w0rp/ale'
Plugin 	'junegunn/fzf'
Plugin 	'mhinz/vim-startify'


" for move like in PHPSTORM
Plugin 'matze/vim-move'
Plugin 'universal-ctags/ctags'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'

" 	working with git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"==========================================
"===	INTELLISENSE FOR VIM		===
"==========================================
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"-----------------------------------------
"		setting
"-----------------------------------------

"		VIM
" <C-k>   Move current line/selections up
" <C-j>   Move current line/selections down
let g:move_key_modifier = 'C'

" windows creation
" create window on the bottom
nnoremap <leader>b <c-w>s
" create vertival window
nnoremap <leader>v <c-w>v
" close buffer window
nnoremap <leader>c <c-w>c
" more suitable keys 
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>

"		NERDTREE
" colorscheme 
colorscheme BusyBee 

" shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"		LIGHTLINE
set laststatus=2
" Colorscheme configuration
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:ale_lint_on_insert_leave = 1
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

"		TAGBAR
nmap <F8> :TagbarToggle<CR>

"		CTRP 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


