export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PRITUNL_PIN=`cat ~/.config/pritunl.pin`
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE="history:ls:pwd:ll:l"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1
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
export PATH="$PATH:$HOME/.local/bin"
# Watch the escapes for " in the following
export PATH="/usr/local/opt/openssl/bin:$PATH"

# homebrew flags
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_EDITOR="/usr/bin/nvim"

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

eval "$(starship init bash)"

# autocomple for kubectl aliases
complete -F __start_kubectl kubeq2p
complete -F __start_kubectl kubepers

# OCTAVIA CLI 0.39.1-alpha
OCTAVIA_ENV_FILE=/Users/Lucas/.octavia
export OCTAVIA_ENABLE_TELEMETRY=False
alias octavia="docker run -i --rm -v \$(pwd):/home/octavia-project --network host --env-file \${OCTAVIA_ENV_FILE} --user \$(id -u):\$(id -g) airbyte/octavia-cli:0.39.1-alpha --airbyte-url $AIRBYTE_URL --workspace-id $AIRBYTE_WORKSPACE_ID --disable-telemetry"

# nvm 
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
