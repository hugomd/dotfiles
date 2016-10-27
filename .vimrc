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
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'dracula/vim'
Plugin 'scrooloose/nerdTree'
Plugin 'moll/vim-node'
Plugin 'vim-scripts/delimitMate.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'airblade/vim-gitgutter'
" Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'qpkorr/vim-bufkill'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'DanielFGray/DistractionFree.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'jacoborus/tender'
Plugin 'scrooloose/syntastic'
Plugin 'mxw/vim-jsx'
Plugin 'junegunn/goyo.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'

Plugin 'edkolev/tmuxline.vim'

call vundle#end()            " required

" Please see http://dougblack.io/words/a-good-vimrc.html
" filetype on    " required
filetype plugin on
syntax enable " syntax highlighting
set background=light " for Solarized only
" colorscheme onedark
" color dracula 
" colorscheme tender
colorscheme solarized
set wildmenu " visual autocomplete
set lazyredraw
set showmatch
set incsearch
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set rnu
set nu
set showcmd
set cursorline
nnoremap j gj
nnoremap k gk
set mouse=a
set foldmethod=indent
set foldnestmax=1
set nofoldenable

set hidden " Allow buffer switching without saving

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

" Git Gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

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
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_user_command = 'find %s -type f' 

" Leader B show CtrlP buffer
nnoremap <c-s-b> :CtrlPBuffer<CR>

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:tender_airline = 1
" let g:airline_theme='tender'
" let g:airline_theme='onedark'
let g:airline_theme='solarized'
set laststatus=2

" allows cursor change in tmux mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" Handle messy clipboard
" http://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register
if $TMUX == ''
  set clipboard+=unnamed
endif

" Automatically open Nerdtree when Vim opens
" autocmd vimenter * NERDTree

" Open nerd tree with leader keey
nmap <leader>n :NERDTreeToggle<CR>

" Buffer searching
" nnoremap <Leader>b :ls<CR>:b<Space>

" Prettier vertical split
set fillchars-=vert:\| | set fillchars+=vert:\ 

" Open vim to last used line
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" TypeScript Support
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:typescript_compiler_binary = 'tsc'
autocmd FileType typescript :set makeprg=tsc
let g:typescript_compiler_options = ''

" YAJS
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['']
" let g:syntastic_javascript_checkers = ['standard']

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

" Tag jumping :) 
command! MakeTags !ctags -R .

" Vim splits without c-w
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
