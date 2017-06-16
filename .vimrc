set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'

" Nerd Tree
Plugin 'scrooloose/nerdTree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Syntax
Plugin 'moll/vim-node'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'DanielFGray/DistractionFree.vim'

" Linting
Plugin 'sindresorhus/vim-xo'

" Movement, etc
Plugin 'vim-scripts/delimitMate.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Layout, panes, etc
Plugin 'junegunn/goyo.vim'

" Git
Plugin 'airblade/vim-gitgutter'

" Colorschemes
Plugin 'jacoborus/tender'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhartington/oceanic-next'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'

call vundle#end()            " required

" Please see http://dougblack.io/words/a-good-vimrc.html
filetype plugin on
syntax enable " syntax highlighting
colorscheme dracula
set wildmenu " visual autocomplete
set lazyredraw
set ttyfast
set showmatch
set incsearch
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ai
set expandtab
set rnu
set nu
set showcmd

" highlight current line and column
set cursorline
" set cursorcolumn

" j and k use visual lines
nnoremap j gj
nnoremap k gk

" Allow buffer switching without saving
set hidden

" Indents
set autoindent
set smartindent

" Mac OS X Clipboard
set clipboard=unnamed

" Fix backspacing up a line
set backspace=2

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Set UTF8
set encoding=utf-8

" Git Gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" jj is escape
inoremap jj <esc>

nnoremap <leader><space> :nohlsearch<CR>

" CtrlP settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](.git|.hg|.svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Leader B show CtrlP buffer
nnoremap <c-s-b> :CtrlPBuffer<CR>

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
set laststatus=2

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '',
      \'y'    : ['%R', 'mbp'],
      \'z'    : ''}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Handle messy clipboard
" http://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register
if $TMUX == ''
  set clipboard+=unnamed
endif

" Open nerd tree with leader keey
nmap <leader>n :NERDTreeToggle<CR>

" Prettier vertical split
set fillchars=""

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Use XO linter
let g:syntastic_javascript_checkers = ['xo']

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Disable syntastic by default
autocmd VimEnter * SyntasticToggleMode

" JSX support
let g:jsx_ext_required = 0

" Distraction Free Vim
nnoremap <Leader>df <Esc>:DistractionsToggle<CR>
let g:distraction_free#toggle_tmux = 1
let g:distraction_free#toggle_limelight = 1

" Move backup, swap and undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Vim splits without c-w
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Automatically reload modified files!
set autoread
autocmd FocusGained * checktime

" Ignore node_modules in vimgrep
set wildignore+=node_modules/**

" Prettier Formatting for JS
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
