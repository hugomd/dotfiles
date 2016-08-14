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
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdTree'
Plugin 'moll/vim-node'
Plugin 'vim-scripts/delimitMate.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'

Plugin 'edkolev/tmuxline.vim'

call vundle#end()            " required

" Please see http://dougblack.io/words/a-good-vimrc.html
filetype on    " required
syntax enable " syntax highlighting

" Theme

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
"   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

color dracula

set wildmenu " visual autocomplete
set lazyredraw
set showmatch
set incsearch
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Set relative number but show the current line number as absolute
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

" Indentation
set smartindent
set autoindent

" Don't require saving buffer before switching
set hidden

" Mac OS X Clipboard
set clipboard=unnamed

" Fix backspacing up a line
set backspace=2

" Map space to : for easier command usage
noremap <space> :

" move to beginning/end of line
" nnoremap B ^
" nnoremap E $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

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
let g:airline_theme='dracula'
set laststatus=2

" allows cursor change in tmux mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']
