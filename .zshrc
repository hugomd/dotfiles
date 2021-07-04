# Path to your oh-my-zsh installation.
export ZSH=/Users/hugo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.  ZSH_THEME="dracula"
ZSH_THEME='dracula-pro'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose z)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Must remain at the END of this file
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export PATH=/usr/local/sbin:$PATH
ctags=/usr/local/bin/ctags

export PATH="$HOME/.yarn/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin

alias npmp='npm --userconfig=~/.npmrc-personal'
alias vim=nvim
alias ls=exa
alias marked="open -a Marked"

. /usr/local/share/zsh/site-functions
. /usr/local/etc/bash_completion.d

# Vim mode
bindkey -v

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d "$HOME/Library/Python/3.6/bin/" ] ; then
    PATH="$HOME/Library/Python/3.6/bin/:$PATH"
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bright grey'

export FZF_DEFAULT_COMMAND='fd --type f'

_gen_fzf_default_opts() {
  local color00='#002b36'
  local color01='#073642'
  local color02='#586e75'
  local color03='#657b83'
  local color04='#839496'
  local color05='#93a1a1'
  local color06='#eee8d5'
  local color07='#fdf6e3'
  local color08='#dc322f'
  local color09='#cb4b16'
  local color0A='#b58900'
  local color0B='#859900'
  local color0C='#2aa198'
  local color0D='#268bd2'
  local color0E='#6c71c4'
  local color0F='#d33682'

  # Solarized Dark color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  #"
  export FZF_DEFAULT_OPTS="
     --height 20%
     --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
     --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
     --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}
_gen_fzf_default_opts

alias cat=bat

export LIBRARY_PATH=/usr/local/lib
export CPLUS_INCLUDE_PATH=/usr/local/include

nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

. $(brew --prefix asdf)/asdf.sh

export KUBECONFIG=$KUBECONFIG:~/.kube/config:~/.kube/sosto-config

alias k=kubectl

export EDITOR=nvim

export ERL_AFLAGS="-kernel shell_history enabled"

autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

zstyle ':fzf-tab:*' default-color $'\033[241m'
# disable sort when completing options of any command
zstyle ':completion:*:git-checkout:*' sort false

export BAT_THEME="Solarized (dark)"
