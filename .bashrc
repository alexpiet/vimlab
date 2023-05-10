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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\u:\w\$ '
    PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    if [ $HOSTNAME == 'hpc-login.corp.alleninstitute.org' ]; then
        PS1='(hpc) \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
    if [ $HOSTNAME == 'behavioral-dynamics' ]; then
        PS1='(beh) \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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





# Alex's Alias Definitions
# ------------------------
alias vimlab='tmux -f ~/.tmux/vimlab attach'
alias pylab='tmux -f ~/.tmux/pylab attach'
alias chrome='google-chrome 2> /dev/null &'
alias l='ls -B --group-directories-first --color=auto --ignore=*.{aux,log,toc,nav,out,snm,pyc} --sort=extension'
alias ls='ls -B --group-directories-first --color=auto --sort=extension --block-size=MB'
alias c..='c ..'
alias c.='c ..'
alias clc='clear && l'
alias lock='xdotool key Super+l'
alias hpc='ssh alex.piet@hpc-login'
alias behdyn='ssh alex.piet@behavioral-dynamics.corp.alleninstitute.org'
alias please='sudo'
alias watch_hpc='watch /home/alex.piet/codebase/utils/hpc.sh'
alias ipy='ipython --nosep --classic'

#source ~/.schedule/.schedulerc
# I dont think I ever got this working
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

v() {
    if hash vimx 2>/dev/null; then
        vimx "$@"
    else
        vim "$@"
    fi
}

# Change Directories, and then ls
c() {
if [ "$1" == "" ]
then
cd
fi
cd "$1"
l -B --group-directories-first 
}

# Open file, and ignore errors
go() {
if [ -d "$1" ]
then
c "$1"
else
xdg-open "$1"  2> /dev/null 
fi
}


# Something for vim, overriding terminal priority
stty -ixon

# file completion, ignore these file types '*.?()' for these commands
complete -f -X '*.?(aux|bib|log|tex|bbl|blg|nav|out|snm|toc)' go 
complete -f -X '*.?(aux|bib|log|pdf|bbl|blg|png|jpeg|nav|out|snm|toc)' v


# Set support for 256 colors
export TERM=xterm-256color

if [ $PWD == "/" ]; then 
    cd ~
fi

cat_files() {
    if [ "$1" != "" ]; then
        echo -e "Reading File: ${1}\n\n"
        cat "$1"
        echo ""
        read -n 1 -p "Press Any key to continue (Ctrl-C to exit):" mainmenuinput
        echo ""
        cat_files "${@:2}"
    fi
}

