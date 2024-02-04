alias ag='ag --vimgrep'
alias aws-whoami='aws sts get-caller-identity'
alias bell='echo -ne \\a'
alias drun='docker run --rm -it -u root --entrypoint /bin/bash'
alias edit-aliases="vim $HOME/.bash_aliases && source $HOME/.bash_aliases"
alias edit-vim="vim $HOME/.config/nvim/init.vim"
alias egrep='egrep --color'
alias f='find . -type f -name'
alias fgrep='fgrep --color'
alias from_sap_ts='_() { [ "$1" ] && x="$1"; date -ur $((y=x/10000, y+631152000)); }; _'
alias g='git'
alias grep='grep --color'
alias j='pbpaste | jq | pbcopy'
alias k=kubecolor
alias kd='_() { [ "$1" ] && /Users/Lucas/.rd/bin/kubectl debug -it node/$1 --image ${2:-wbitt/network-multitool:alpine-extra} -- /bin/bash || k --force-colors get node | grep Ready | cut -wf1; }; _'
alias kn='_() { [ "$1" ] && k config set-context --current --namespace $1 || k config view --minify | grep namespace | cut -d" " -f6; }; _'
alias kx='_() { [ "$1" ] && k config use-context $1 || k config view -o jsonpath="{.contexts}" | jq -r ".[].name" | grep -e "^" -e "^\b"`k config current-context`"\b$"; }; _'
alias l='ls -l1'
alias la='ls -A'
alias ll='ls -alFh'
alias ll='ls -alFh@'
alias ls='ls -Gp'
alias pluginstall="nvim --headless -c ':PlugInstall' -c ':qa'"
alias snowsql="/Applications/SnowSQL.app/Contents/MacOS/snowsql"
alias t=terraform
alias to_sap_ts='_() { [ "$1" ] && x=`date -j -f "%Y-%m-%d %H:%M:%S %z" "$1" "+%s"`; echo $((y=x-631152000, y*10000)); }; _'
alias tree='tree --gitignore'
alias vi='nvim'
alias vim='nvim'
alias watch='watch -n 1 ' 
alias watch='watch'
alias xgimi-mute='(adb kill-server && adb connect `arp -a | grep "60:23:a4:5c:9a:66" | cut -d"(" -f2 | cut -d")" -f1` && adb -e shell media volume --set 0) 1>/dev/null 2>/dev/null'
