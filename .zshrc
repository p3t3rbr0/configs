export LANG=en_US.UTF-8
export LESS=eFRX
export EDITOR="nano" # Default console editor

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
# alias df="df -h"
# alias lsa="ls -lAh --color=auto --group-directories-first"
# alias ls="ls --color=auto --group-directories-first"
# alias grep="grep --colour=auto"
# alias mocp="mocp -T nightly_theme"

# export PATH=$PATH:~/perl5/bin
# export PERL5LIB=$PERL5LIB:~/perl5/lib/perl5
# export JAVA_HOME=/usr/lib64/jdk1.8.0_162
# export SCALA_HOME=/usr/lib64/scala
# export PATH=$PATH:$JAVA_HOME/bin:$SCALA_HOME/bin

export TERM=xterm-256color
export COLORTERM=trueolor
