" Specify a directory for plugins (for Neovim: ~/.config/nvim/plugins)
call plug#begin('~/.config/nvim/plugins')

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Nerd Tree
Plug 'scrooloose/nerdTree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'elixir-lang/vim-elixir'
Plug 'w0rp/ale'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'slashmili/alchemist.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Search
Plug 'eugen0329/vim-esearch'

" Movement, etc
Plug 'vim-scripts/delimitMate.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Layout, panes, etc
Plug 'junegunn/goyo.vim'
Plug 'chrisbra/NrrwRgn'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Colorschemes
Plug 'dracula/vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" Initialize plugin system
call plug#end()

" Defaults
filetype plugin on
syntax enable
set wildmenu
set showmatch
set incsearch
set hlsearch
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set rnu
set nu

" Colorscheme
colorscheme dracula

" highlight current line and column
set cursorline
" set cursorcolumn

" j and k use visual lines
nnoremap j gj
nnoremap k gk

" Allow buffer switching without saving
set hidden

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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

let mapleader=" "       " leader is space

" jj is escape
inoremap jj <esc>

" nnoremap <leader><h> :nohlsearch<CR>

" CtrlP settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](.git|.hg|.svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

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
nnoremap <C-e> :NERDTreeToggle<CR>

" Prettier vertical split
set fillchars=""

" Ale
let g:ale_lint_on_enter = 0

let g:ale_linters = {
\   'javascript': ['xo'],
\}
let g:ale_javascript_xo_use_global = 0
let g:ale_javascript_xo_options = '--space'

let g:airline#extensions#ale#enabled = 1

" Use C-k and C-j to skip to next/previous ALE issues
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" JSX support
let g:jsx_ext_required = 0

" Move backup, swap and undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Vim splits without c-w
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Ignore node_modules in vimgrep
set wildignore+=node_modules/**

" Fix neovim not finding files using `gf`
set suffixesadd=.js,.css

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Run Neoformat on save
" autocmd BufWritePre *.js :normal gggqG

" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5\ --tab-width\ 2\ --bracket-spacing
" Use formatprg when available
"" let g:neoformat_try_formatprg = 1

" Search
let g:esearch = {
  \ 'adapter':    'grep',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
