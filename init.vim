" Specify a directory for plugins (for Neovim: ~/.config/nvim/plugins)
call plug#begin('~/.config/nvim/plugins')

" Vim Lightline
Plug 'itchyny/lightline.vim'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Nerdtree & icons
Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'md'] }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go'] }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'w0rp/ale'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Undo tree
Plug 'mbbill/undotree'

" Completion
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'zxqfl/tabnine-vim'

" Movement, etc
Plug 'vim-scripts/delimitMate.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'easymotion/vim-easymotion'

" Layout, panes, etc
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Colorschemes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Tmux
Plug 'christoomey/vim-tmux-navigator'

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
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (has("nvim"))
"   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

colorscheme challenger_deep
let g:lightline = { 'colorscheme': 'challenger_deep'}

" highlight current line and column
set cursorline
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

let mapleader=" " " leader is space

" jj is escape
inoremap jj <esc>

set mouse=a

" fzf settings
nmap ; :Buffers<CR>
nnoremap <C-g> :GitFiles?<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Tags<CR>

" Vim Lightline
set laststatus=2

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
let g:ale_lint_on_enter = 1
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '•'
" let g:ale_sign_warning = '⚠️'

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

" Search
let g:esearch = {
  \ 'adapter':    'grep',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
	\ 'default_mappings': 1,
  \}

let g:esearch#adapter#grep#options = '--exclude-dir=node_modules'

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" 
" " IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" 
" " Use <TAB> to select popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Terminal remapping
tnoremap kj <C-\><C-n>

" NerdTree Mapping
map <C-n> :NERDTreeToggle<CR>
set showcmd
" hi Normal ctermbg=NONE guibg=NONE

" Enable per project configuration https://andrew.stwrt.ca/posts/project-specific-vimrc/
set exrc
set secure
set noshowmode
