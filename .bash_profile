export KUBECONFIG=$(find $HOME/.kube -d 1 -type f | tr \\n :)
export EDITOR=`which nvim`
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export MELTANO_SEND_ANONYMOUS_USAGE_STATS=False
export PIP_REQUIRE_VIRTUALENV=True
export KUBE_EDITOR=/usr/local/bin/nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export STELLAR_CORE_BINARY_PATH=`which stellar-core`
export GOPATH=$HOME/.go
export PRITUNL_PIN=`cat ~/.config/pritunl.pin`
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE="history:ls:pwd:ll:l"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib
export LDFLAGS="-L/usr/local/Cellar/openssl@1.1/1.1.1d/lib"
export CPPFLAGS="-I/usr/local/Cellar/openssl@1.1/1.1.1d/include"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# path to binary files
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/Applications/Pritunl.app/Contents/Resources:$PATH"
export PATH="/usr/local/opt/go@1.14/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/libxmlsec1/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
# pipx
export PATH="$PATH:/Users/Lucas/.local/bin"
# Watch the escapes for " in the following
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# make stellar-core
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(brew --prefix)/opt/libpq/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(brew --prefix)/opt/openssl@3/lib/pkgconfig"

# homebrew flags
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_EDITOR="/usr/bin/vim"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'; fi

# disable next telemetry
export NEXT_TELEMETRY_DISABLED=1
# suppres zsh is the default shell message
export BASH_SILENCE_DEPRECATION_WARNING=1
#  fix brew doctor's warning ""config" scripts exist outside your system
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
eval "$(pyenv init --path)"
source $HOME/.iterm2_shell_integration.bash

# autocomplete vpn
_complete_vpn ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_vpn=`pritunl-client list | \
					 grep '(' | \
					 cut -d'(' -f2 | \
					 cut -d')' -f1`
        COMPREPLY=( $(compgen -W "${comp_vpn}" -- $cur))
        return 0
}
complete -F _complete_vpn vpn

# autocomplete ssh hosts
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

__git_complete g __git_main # git autocomplete

eval "$(starship init bash)"

# nvm 
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm "$@"
}

# cargo
. "$HOME/.cargo/env"
export PATH="/usr/local/opt/bison/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/bison/lib"

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/Lucas/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
