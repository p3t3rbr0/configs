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

# Hostname prompt
HP="%{$fg_bold[green]%}%m%{$reset_color%}"
if [[ $EUID == 0 ]]; then HP="%{$fg_bold[red]%}%m%{$reset_color%}" fi

# Set prompt
PS1="[$HP:%2~]$VCS_PROMPT$UID_SYM "

# Autocomplete settings
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# Variables
export LANG=en_US.UTF-8
export LESS=eFRX
export EDITOR="nano"
export TERM=xterm-256color
export COLORTERM=trueolor

# Scale UI (4K monitor)
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

export PATH="/home/peter/scripts${PATH:+:${PATH}}"

# Perl
export PATH="/home/peter/perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="/home/peter/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="/home/peter/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"/home/peter/perl5\"";
export PERL_MM_OPT="INSTALL_BASE=/home/peter/perl5";

# Java/Scala
export _JAVA_AWT_WM_NONREPARENTING=1

#
# Aliases
#

# Common
alias mc="mc -S gray-orange-blue256"
alias df="df -h"
alias lsa="ls -lAh --color=auto --group-directories-first"
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --colour=auto"
alias mocp="mocp -T nightly_theme"

# SSH
alias vps="ssh -p 16622 <login>@<ip> -t 'tmux attach-session -t peter'"

# Docker
alias dps="docker ps --format \"{{.Names}} ({{.ID}})\""

# k8s
alias kbs_pods="kubectl -n <namespace> get pod"
alias kbs_deps="kubectl -n <namespace> get deployments"
# alias kbs_another_cluster_pods="kubectl --kubeconfig ~/.kube/staging_cfg -n <namespace> get pod"

#
# Functions
#

# Common

gkill(){
    kill -9 $(ps aux | grep -v grep | grep "$1" | tr -s ' ' | cut -d ' ' -f 2)
}

# k8s
kbs_logs(){
    kubectl -n <namespace> logs --tail=100 -f "$1"
}

kbs_exec(){
    [ -z "$2" ] && kubectl -n <namespace> exec -ti "$1" -- "$2" || kubectl -n <namespace> exec -ti "$1" -- sh
}

kbs_desc(){
    kubectl -n <namespace> describe pods "$1"
}
