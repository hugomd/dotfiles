fish_vi_key_bindings

set -x --universal GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.cargo/env
set -x PATH $PATH ~/.luarocks/bin # add luarocks
set -x PATH $PATH /usr/local/opt/openssl/bin

function npmp
  npm --userconfig=~/.npmrc-personal
end

alias ls exa

function marked
  open -a Marked
end

set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS "
  --height 20%
"

alias cat bat
 
alias ping prettyping

set -x LIBRARY_PATH /usr/local/lib
set -x CPLUS_INCLUDE_PATH /usr/local/include

# Fix for installing node-rdkafka
set -x CPPFLAGS -I /usr/local/opt/openssl/include
set -x LDFLAGS -L /usr/local/opt/openssl/lib

# Save history in iex
set -x ERL_AFLAGS "-kernel shell_history enabled"

set -x KUBECONFIG ~/.kube/config
set -x KUBECONFIG $KUBECONFIG:~/madrisa-nyc-01-kubeconfig.yaml
set -x KUBECONFIG $KUBECONFIG:~/.kube/config-sosto

set -x GO111MODULE on
source ~/.asdf/asdf.fish

set -x SPACEFISH_KUBECONTEXT_SHOW false

set -x LUA_PATH '/Users/hugo/.luarocks/share/lua/5.1/?.lua;/Users/hugo/.luarocks/share/lua/5.1/?/init.lua;/usr/local/Cellar/luarocks/3.1.3/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;./?.lua;./?/init.lua'
set -x LUA_CPATH '/Users/hugo/.luarocks/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;./?.so'
