" Specify a directory for plugins (for Neovim: ~/.config/nvim/plugins)
call plug#begin('~/.config/nvim/plugins')

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Nerdtree & icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'md'] }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go'] }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'w0rp/ale'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Completion
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Search
Plug 'eugen0329/vim-esearch'

" Movement, etc
Plug 'vim-scripts/delimitMate.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'

" Layout, panes, etc
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

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
set encoding=UTF-8

" Search as you type
set incsearch
" Highlight search results
set hlsearch
set ignorecase
set smartcase
" Stop highlighting on enter
map <CR> :noh<CR> 

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set rnu
set nu

set title

" Colorscheme
if (has("termguicolors"))
 set termguicolors
endif

colorscheme dracula

" highlight current line and column
" set cursorline
" set cursorcolumn

" j and k use visual lines
nnoremap j gj
nnoremap k gk

" Allow buffer switching without saving
set hidden

" Cycle through buffers
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>

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

set mouse=a

" fzf settings
nmap ; :Buffers<CR>
nnoremap <C-g> :GitFiles?<CR>
nnoremap <C-p> :GitFiles<CR>

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
set laststatus=2

let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'b': '',
        \ 'c': '',
        \ 'win': '#I #W',
        \ 'cwin': '#I #W',
        \ 'x': '', 
        \ 'y': ['%R'],
        \ 'z': 'mbp',
				\ 'options': {
        \'status-justify': 'left'}
        \}

let g:tmuxline_powerline_separators = 1

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

" Prettier vertical split
set fillchars=""

" Ale
let g:ale_lint_on_enter = 0

" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '🚨'
" let g:ale_sign_warning = '⚠️'
" 
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" let g:ale_linters = {
" \   'javascript': ['standard'],
" \}
" let g:ale_javascript_xo_use_global = 0
" let g:ale_javascript_standard_use_global = 0
" 
"  " , 'xo', 'eslint'
" let g:ale_fixers = {
" \   'javascript': ['prettier', 'standard'],
" \}
" let g:airline#extensions#ale#enabled = 1
" let g:ale_javascript_prettier_use_local_config = 1

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

" Search
let g:esearch = {
  \ 'adapter':    'grep',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

let g:esearch#adapter#grep#options = '--exclude-dir=node_modules'

" Completion https://github.com/roxma/nvim-completion-manager#features
" Enter sends new line and hides completion bar
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Terminal remapping
tnoremap kj <C-\><C-n>

" NerdTree Mapping
map <C-e> :NERDTreeToggle<CR>

" Vim devicons
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set showcmd
hi Normal ctermbg=NONE guibg=NONE

" Toggle tabs
function TabToggle()
	if &expandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
		set shiftwidth=2
		set softtabstop=0
		set noexpandtab
	else
		set shiftwidth=2
		set softtabstop=2
		set expandtab
	endif
endfunction

" Enable per project configuration https://andrew.stwrt.ca/posts/project-specific-vimrc/
set exrc
set secure
