fish_vi_key_bindings

set -x --universal GOPATH $HOME/go
set -x PATH $PATH:$GOPATH/bin
set -x PATH $PATH:$HOME/.cargo/env

function npmp
  npm --userconfig=~/.npmrc-personal
end

function ls 
  exa
end

function marked
  open -a Marked
end

set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS "
  --height 20%
"

alias cat bat
 
function ping
  prettyping
end

set -x LIBRARY_PATH /usr/local/lib
set -x CPLUS_INCLUDE_PATH /usr/local/include

# Fix for installing node-rdkafka
set -x CPPFLAGS -I/usr/local/opt/openssl/include
set -x LDFLAGS -L/usr/local/opt/openssl/lib

# Save history in iex
set -x ERL_AFLAGS "-kernel shell_history enabled"

set -x KUBECONFIG ~/.kube/config
set -x KUBECONFIG $KUBECONFIG:~/madrisa-nyc-01-kubeconfig.yaml
set -x KUBECONFIG $KUBECONFIG:~/.kube/config-sosto

set -x PATH "/usr/local/opt/openssl/bin:$PATH"

set -x LDFLAGS "-L/usr/local/opt/openssl/lib"
set -x CPPFLAGS "-I/usr/local/opt/openssl/include"

set -x GO111MODULE on
