export LANG=en_US.UTF-8
export LESS=eFRX
export EDITOR="emacs -nw" # Default console editor

bindkey -e # Emacs-like shortcuts
bindkey '\e[3~' delete-char # now del character works ok

# History commans settings
HISTFILE="$HOME/.zsh_history"
SAVEHIST=2000
HISTSIZE=2000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY # One history between all terminals

# Prompt settings
autoload -U promptinit colors && colors && promptinit

# Enable minimal vcs info (full doc - http://www.zsh.org/mla/users/2008/msg00842.html)
autoload -Uz vcs_info && vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats "(%s:%b)" # vcs name and current branch
precmd () { vcs_info }
setopt prompt_subst
VCS_PROMPT="%{$fg_bold[blue]%}\$vcs_info_msg_0_%{$reset_color%}"

# Set spec symbol for uid (for root is a bold, red #, for other uids - bold, green $).
UID_SYM="%{$fg_bold[green]%}$%{$reset_color%}%b"
if [[ $EUID == 0 ]]; then UID_SYM="%{$fg_bold[red]%}#%{$reset_color%}%b" fi

# hostname prompt
HP="%{$fg_bold[green]%}%m%{$reset_color%}"
if [[ $EUID == 0 ]]; then HP="%{$fg_bold[red]%}%m%{$reset_color%}" fi

# Set prompt.
PS1="[$HP:%2~]$VCS_PROMPT$UID_SYM "

# Autocomplete settings
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# Command aliases
alias mc="mc -S gray-orange-blue256"
alias df="df -h"
alias lsa="ls -lAh --color=auto --group-directories-first"
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --colour=auto"
# alias mocp="mocp -T nightly_theme"

export PATH=$PATH:~/perl5/bin:~/opt/bin
export PERL5LIB=$PERL5LIB:~/perl5/lib/perl5

# export JAVA_HOME=/usr/lib64/jdk1.8.0_162
# export SCALA_HOME=/usr/lib64/scala
# export PATH=$PATH:$JAVA_HOME/bin:$SCALA_HOME/bin
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
# export JAVA_HOME="/usr/local/opt/openjdk/bin/java"

export TERM=xterm-256color
export COLORTERM=trueolor

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# SSH aliases
alias 21stf="ssh -p 16622 web@212.109.223.252"
alias dslife="ssh peter.brovchenko@cbroker-deploy.reg.ru"
alias morph="ssh peter.brovchenko@31.31.205.31"
alias logs="ssh peter.brovchenko@logs.reg.ru"
alias ts="ssh peter.brovchenko@market.int.reg.ru"

alias vps="ssh -p 16622 peter@82.146.61.196 -t 'tmux attach-session -t peter'"

# k8s
alias kbs_pods="kubectl -n regru get pod"
alias kbs_pods_bhv="kubectl -n beehive get pod"

alias kbs_staging_pods="kubectl --kubeconfig ~/.kube/staging_cfg -n regru get pod"
alias kbs_staging_pods_bhv="kubectl --kubeconfig ~/.kube/staging_cfg -n beehive get pod"

alias kbs_deps="kubectl -n regru get deployments"
alias kbs_deps_bhv="kubectl -n beehive get deployments"

kbs_logs(){
    kubectl -n regru logs --tail=100 -f "$1"
}
kbs_logs_bhv(){
    kubectl -n beehive logs --tail=100 -f "$1"
}

kbs_staging_logs(){
    kubectl --kubeconfig ~/.kube/staging_cfg -n regru logs --tail=100 -f "$1"
}
kbs_staging_logs_bhv(){
    kubectl --kubeconfig ~/.kube/staging_cfg -n beehive logs --tail=100 -f "$1"
}

kbs_exec(){
    [ -z "$2" ] && kubectl -n regru exec -ti "$1" -- "$2" || kubectl -n regru exec -ti "$1" -- sh
}
kbs_exec_bhv(){
    [ -z "$2" ] && kubectl -n beehive exec -ti "$1" -- "$2" || kubectl -n beehive exec -ti "$1" -- sh
}

kbs_staging_exec(){
    [ -z "$2" ] && kubectl --kubeconfig ~/.kube/staging_cfg -n regru exec -ti "$1" -- "$2" || kubectl --kubeconfig ~/.kube/staging_cfg -n regru exec -ti "$1" -- sh
}
kbs_staging_exec_bhv(){
    [ -z "$2" ] && kubectl --kubeconfig ~/.kube/staging_cfg -n beehive exec -ti "$1" -- "$2" || kubectl --kubeconfig ~/.kube/staging_cfg -n beehive exec -ti "$1" -- sh
}

kbs_desc(){
    kubectl -n regru describe pods "$1"
}
kbs_desc_bhv(){
    kubectl -n beehive describe pods "$1"
}

gkill(){
    kill -9 $(ps aux | grep -v grep | grep "$1" | tr -s ' ' | cut -d ' ' -f 2)
}

# Docker aliases
alias dps="docker ps --format \"{{.Names}} ({{.ID}})\""
