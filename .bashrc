# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias :q='exit'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function d () {
    cd "$@" && ls
}

alias rc='rebar compile'
bind '"\ep"':"\"cd .. && ls \C-m\""
alias sl='ls'
alias vnc='virt-viewer -c qemu:///system '
alias ips='sudo arp-scan --interface=wlan0 --localnet'
alias gu='git add -u'
alias ga='git add .'
alias gs='git status'
alias gus='git add -u; git status'
alias gp='git pull'
alias pi='ssh pi@10.0.1.253'
alias retro='ssh pi@10.0.1.156'
alias mca='make clean all'
alias amazon='ssh -i ~/.ssh/haskellpar.pem ec2-user@54.194.70.160'
alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n '
alias gb='git branch -v'
alias 6.3='source ~/Documents/erlang/confd_basic/confdrc'
export SOUNDCLOUD="not_defined"

# Do not open tmux if shell in emacs
if [ -n "$EMACS" ];
then
    echo "emacs!";
else
    case $- in *i*)
                   [ -z "$TMUX" ] && exec tmux
    esac
    tmux source ~/.tmux.conf;
fi

alias irssi='TERM=screen-256color irssi'

export PATH="/Users/kristian/Documents/lux/bin:$PATH"
export ERL_TOP="/usr/local/lib/erlang"
